$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("C:\script\shortcut.lnk")
$shortcut.TargetPath = "C:\Windows\System32\cmd.exe"
$shortcut.Save()

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("C:\script\adobe.lnk")

$pwsh_path = "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"
if ($shortcut.TargetPath -ne $pwsh_path) {
    $shortcut.TargetPath = $pwsh_path
  <#  $shortcut.IconLocation = "C:\script\favico.ico"#>
    $shortcut.Save()
}

<#New-Item -Path "$env:USERPROFILE\desktop\test.lnk" -Value C:\WINDOWS\explorer.exe -ItemType SymbolicLink#>


$path = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\I-Integrate"
If(!(test-path $path))
{
    New-Item -ItemType Directory -Force -Path $path
}

# Create a Shortcut with Windows PowerShell
<#$TargetFile = "C:\Program Files (x86)\Younts Consulting\I-Integrate\I_Integrate.exe"
$ShortcutFile = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\I-Integrate\I-Integrate.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()#>
