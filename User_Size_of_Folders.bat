@ECHO OFF
SET ThisScriptsDirectory=\\USALPLATP01\DropBox\Sidt_Saunders\Scripts\Script_Files\User_Size_of_Folders\
SET PowerShellScriptPath=%ThisScriptsDirectory%User_Size_of_Folders.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%PowerShellScriptPath%""' -Verb RunAs}";