@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0CombinePDFs.ps1" %*
