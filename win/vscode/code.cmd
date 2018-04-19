@echo off
setlocal
set VSCODE_DEV=
set ELECTRON_RUN_AS_NODE=1
call "%~dp0..\Code - Insiders.exe" "%~dp0..\resources\app\out\cli.js" %* --disable-gpu
endlocal