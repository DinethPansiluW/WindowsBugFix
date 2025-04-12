@echo off
REM Batch script to re-enable automatic Windows 11 updates
REM Requires administrator privileges

:: Check for administrator privileges
fsutil dirty query %SystemDrive% >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Requesting administrative privileges...
    powershell Start-Process -FilePath "%0" -Verb RunAs
    exit /b
)

echo Restoring default Windows Update settings...

:: Remove registry entries created by the disable script
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /f >nul 2>&1

echo Successfully restored default Windows Update settings.
echo Windows Update will now function with default Microsoft settings.
echo A system restart may be required for changes to take effect.

pause