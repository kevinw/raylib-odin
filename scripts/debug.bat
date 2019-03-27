@setlocal

set EXENAME=live_reload_host.exe

copy bin\%EXENAME% . || exit /b 1
devenv.exe %EXENAME% || exit /b 1
