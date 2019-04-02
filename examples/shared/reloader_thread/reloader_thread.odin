package reloader_thread

import "core:thread"
import "core:fmt"
import "core:strings"

import "core:sys/win32"

compile_game_dll :: proc() -> bool {
    startup_info : win32.Startup_Info;
    startup_info.cb = size_of(win32.Startup_Info);

    process_information: win32.Process_Information;

    if ok := win32.create_process_a(nil, _recompile_script, nil, nil, false, 0, nil,  nil, &startup_info, &process_information); !ok {
        fmt.println_err("could not invoke build script");
        return false;
    }

    if win32.WAIT_OBJECT_0 != win32.wait_for_single_object(process_information.process, win32.INFINITE) {
        fmt.println_err("ERROR invoking build batch file");
        return false;
    }

    // TODO: something like win32.destroy_handle(process_information.process);

    return true;
}

watcher_thread_proc :: proc(^thread.Thread) -> int {
    fmt.println("watching for changes in", _directory_to_watch);

    watch_subtree:win32.Bool : true;
    filter:u32 : win32.FILE_NOTIFY_CHANGE_LAST_WRITE;
    FALSE:win32.Bool : false;

    handle := win32.find_first_change_notification_a(_directory_to_watch, watch_subtree, filter);
    if handle == win32.INVALID_HANDLE {
        fmt.println_err("FindFirstChangeNotification failed");
        return -1;
    }

    next_timeout_ms:u32 = win32.INFINITE;
    did_get_change := false;

    for {
        wait_status := win32.wait_for_single_object(handle, next_timeout_ms);

        switch wait_status {
            case win32.WAIT_OBJECT_0:
                // when we get a file change notification, it's often immediately followed by another one.
                // so we'll lower our timeout and use that as a signal to actually recompile, to coalesce
                // multiple updates into one.
                next_timeout_ms = 150;
                did_get_change = true;
            case win32.WAIT_TIMEOUT:
                if !did_get_change {
                    panic("error: infinite timeout triggered");
                    return -1;
                }

                // actually recompile the game.dll
                did_get_change = false;
                next_timeout_ms = win32.INFINITE;
                if ok := compile_game_dll(); !ok {
                    fmt.println_err("result:", ok);
                }
            case:
                fmt.println_err("unhandled wait_status", wait_status);
                return -1;
        }

        if win32.find_next_change_notification(handle) == FALSE {
            fmt.println_err("error in find_next_change_notification");
            return -1;
        }
    }

    return 0;
}

_recompile_script: cstring;
_directory_to_watch: cstring;

start :: proc(recompile_script: string, directory_to_watch: string) -> ^thread.Thread {
    assert(_recompile_script == nil, "only one reloader thread can exist at once");

    _recompile_script = strings.clone_to_cstring(recompile_script);
    _directory_to_watch = strings.clone_to_cstring(directory_to_watch);

    watcher_thread := thread.create(watcher_thread_proc);
    thread.start(watcher_thread);
    return watcher_thread;
}

finish :: proc(watcher_thread: ^thread.Thread) {
    // TODO: signal to thread it should exit gracefully with CreateEvent like https://docs.microsoft.com/en-us/windows/desktop/sync/using-event-objects
}

