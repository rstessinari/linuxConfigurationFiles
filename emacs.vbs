' This script is meant to be launched from Windows
Set shell = CreateObject("WScript.Shell" )

shell.Run """C:\Windows\System32\wsl.exe"" zsh -c '/mnt/c/_temp/Dropbox/Work/2018-Bristol/20190724-InstallingEmacsWindows/emacs.launcher.zsh'", 0
