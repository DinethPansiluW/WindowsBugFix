@echo off
:: Enable background apps by removing the Group Policy restriction

REG DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /f

echo Background apps setting restored (enabled).
pause
