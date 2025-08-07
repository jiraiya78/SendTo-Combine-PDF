@echo off
setlocal

rem Get folder of this batch file (with trailing backslash)
set "SCRIPT_FOLDER=%~dp0"
rem Remove trailing backslash if present
if "%SCRIPT_FOLDER:~-1%"=="\" set "SCRIPT_FOLDER=%SCRIPT_FOLDER:~0,-1%"

rem Define SendTo folder path for current user
set "SENDTO_FOLDER=%APPDATA%\Microsoft\Windows\SendTo"

rem Define shortcut name and path
set "SHORTCUT_NAME=CombinePDFs.lnk"
set "SHORTCUT_PATH=%SENDTO_FOLDER%\%SHORTCUT_NAME%"

rem Create shortcut using a single-line PowerShell command (no carets inside the command)
powershell -NoProfile -Command ^
  "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT_PATH%'); $s.TargetPath = 'powershell.exe'; $s.Arguments = '-ExecutionPolicy Bypass -File \"%SCRIPT_FOLDER%\\CombinePDFs.ps1\"'; $s.WorkingDirectory = '%SCRIPT_FOLDER%'; $s.IconLocation = 'powershell.exe,0'; $s.Save();"

if exist "%SHORTCUT_PATH%" (
    echo Shortcut created successfully in SendTo folder:
    echo %SHORTCUT_PATH%
) else (
    echo Failed to create shortcut.
)

pause
endlocal
