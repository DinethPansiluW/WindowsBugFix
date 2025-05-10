@echo off
:: Disable background apps via Group Policy equivalent

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t REG_DWORD /d 2 /f

echo Background apps disabled via Group Policy registry.
pause
