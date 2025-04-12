@echo off
set "filePath=%LocalAppData%\Updates\Run.vbs"

:: Delete the existing file if it exists
if exist "%filePath%" del "%filePath%"

:: Create a new empty file
type nul > "%filePath%"

echo Operation completed.
