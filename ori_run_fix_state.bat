@echo off
setlocal enabledelayedexpansion

echo Starting server
start /B python server.py -p 8081

timeout 3 > nul

set env_list="CartPoleSwingUpFixInitState-v0" "CartPoleSwingUpFixInitState-v0" "CartPoleSwingUpFixInitState-v0" "CartPoleSwingUpFixInitState-v0"

set i=0
for %%v in (%env_list%) do (
    echo Starting client !i!
    echo %%v
    start /B python client_FixState.py -i !i! -p 8081
    set /a i+=1
)

:loop
tasklist /FI "IMAGENAME eq python.exe" |find "python.exe" >nul
if not errorlevel 1 goto loop

echo All processes completed.
pause