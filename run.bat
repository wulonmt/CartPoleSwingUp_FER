@echo off
setlocal enabledelayedexpansion

echo Starting server
start /B python server.py

timeout 3 > nul

set env_list="highway_hard" "highway_hard" "highway" "highway"

set i=0
for %%v in (%env_list%) do (
    echo Starting client !i!
    echo %%v
    start /B python FERclient.py -i !i!
    set /a i+=1
)

:loop
tasklist /FI "IMAGENAME eq python.exe" |find "python.exe" >nul
if not errorlevel 1 goto loop

echo All processes completed.
pause