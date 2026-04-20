@echo off
NET FILE||(powershell -Command "Start-Process '%0' -Verb RunAs"&&exit)
setlocal enabledelayedexpansion
cls
title Ferri mantainer
echo Welcome to Ferri mantainer! Are you ready for the scan and all the job? 
CHOICE /c yn /m "Are you ready?" 
if errorlevel 2 exit
if errorlevel 1 goto disclamer
cls

:disclamer
cls
color c7
echo Warning!!!
echo Before continue, you have to agree that:
echo 1) You read the Readme.md file and you are okay with it
echo 2) You accept that this tool is as is
echo If you are NOT AGREE, close ths programe INMEDIATLY
timeout /t 3
cls
color f
goto :malwarescan

:malwarescan
echo Now we will scan for malware, wait, it can take some minutes...
mrt.exe /q
cls
echo Task finalized (1/3)
goto freespace

:freespace
echo Now, we will try to increase your free disk space.
del /q /f /s %temp%\*
CLS
echo Task finalized (2/3)
goto integrty

:integrty
echo Finally, we will check the interity of windows abd all of that sutff, wait...
sfc /scannow
powershell -Command "dism /online /cleanup-image /startcomponentcleanup"
cls
echo Task finalized (3/3)
goto finalized

:finalized
color 1f
echo Now we are done!
echo Thanks for trusting tihs tool, bye!
pause
