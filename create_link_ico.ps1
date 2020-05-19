WshShell = CreateObject("Wscript.shell")
strDesktop = WshShell.SpecialFolders("Desktop")
oMyShortcut = WshShell.CreateShortcut(strDesktop + "\Sample.lnk")
oMyShortcut.WindowStyle = None
oMyShortcut.IconLocation = "C:\script\favico.ico"
OMyShortcut.TargetPath = "%windir%\notepad.exe"
oMyShortCut.Hotkey = "ALT+CTRL+F"
oMyShortCut.Save