# odin-raylib

Bindings for [raylib](http://www.raylib.com), a small C gamedev library, for the [odin programming language](https://odin.handmade.network/).

These are usable, but in a pre-alpha state and definitely a work in progress.

from [Kevin Watters](https://kev.town)

## Prerequisites

- Windows 10 (for now)
- Visual Studio 2017
- A command-line prompt opened with the "x64 Native Tools Command Prompt for VS 2017" shortcut
- `odin` on your PATH (built from odin's `master` branch is good)

## Running the examples

### `examples/simple_demo`

To run a simple demo:

```
scripts\run_simple_demo
```

You should see this:

![a screenshot of a simple demo](resources/screenshots/example_simple_demo.png)

### `examples/live_reload_demo`

To run the live reload demo, first make sure you have the `sane` file watching tool:

```
npm install -g sane
```

Then, start the live reload demo "host" program:

```
scripts\run_live_reload_demo
```

You should see the demo appear.

![a screenshot of the live reload demo](resources/screenshots/example_live_reload.png)

Then, in another console window (also opened with the "x64 Native Tools Command Prompt for VS 2017" shortcut), run

```
scripts\run_live_reload_watcher
```

This will use `sane` to rebuild `bin/game.dll` anytime you make edits. When `bin/game.dll` is updated, the live reload host
will notice, and reload the plugin.

Try editing some of the values in `examples/live_reload_demo/game.odin` and saving the file to see the changes instantly.

![live reload example](resources/live-reload.gif)

## Bindings

To rebuild the bindings to raylib, run `scripts\build_raylib_bindings.bat`.

## TODO

- (maybe) implement a file watcher so that the live reload stuff doesn't need an external dependency like watchman
- fix up bindgen code so that raylib.h doesn't need to be hand-tweaked

## Acknowledgements

- Thanks to [@TheElkantor](https://twitter.com/theelkantor) for their article ["How to add hot reload when using raylib"](https://www.developing-stuff.com/how-to-add-hot-reload-when-using-raylib/) - for pointing out that passing function pointers to a plugin was probably the easiest way to get a live reload harness going.

