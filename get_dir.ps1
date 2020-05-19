
Get-ChildItem | Foreach-Object {
	Write-Output $_.FullName
  #  Copy-Item -Path $_.FullName -destination C:\script\test\
}


Get-ChildItem C:\MyFolder | Select-Object Name, @{Name="Size_In_KB";Expression={$_.Length / 1Kb}}











#powershell.exe -ExecutionPolicy Bypass -File "c:\MyScript.ps1"