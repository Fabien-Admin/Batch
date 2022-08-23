@echo off

REM **** Suppression du fichier C:\Users\%USERNAME%\AppData\Local\Temp
rmdir "C:\Users\%USERNAME%\AppData\Local\Temp" /s /q

REM **** Suppression du fichier %WINDIR%\TEMP
rmdir "%WINDIR%\TEMP" /s /q