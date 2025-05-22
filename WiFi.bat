@echo off
setlocal

:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    :: Create a temporary VBScript to relaunch this script with admin rights
    >"%temp%\getadmin.vbs" (
        echo Set UAC = CreateObject^("Shell.Application"^)
        echo UAC.ShellExecute "%~f0", "", "", "runas", 1
    )
    :: Run the VBScript silently and exit the current window
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit
)

set interfaceName=Wi-Fi

:menu
cls
echo Choose an option:
echo 1. Enable Wi-Fi
echo 2. Disable Wi-Fi
echo 3. Exit

set /p choice=Enter choice [1-3]:

if "%choice%"=="1" (
    echo Enabling Wi-Fi...
    netsh interface set interface name="%interfaceName%" admin=enabled
    goto status
) else if "%choice%"=="2" (
    echo Disabling Wi-Fi...
    netsh interface set interface name="%interfaceName%" admin=disabled
    goto status
) else if "%choice%"=="3" (
    goto end
) else (
    echo Invalid choice, try again.
    pause
    goto menu
)

:status
echo.
netsh interface show interface name="%interfaceName%"
echo.
pause
goto menu

:end
echo Exiting...
pause
endlocal
