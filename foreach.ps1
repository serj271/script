Get-ChildItem | ForEach-Object {
	Copy-Item -Path $_.FullName -destination C:\NewDirectory\
}
#This may be shortened to:
#gci | % { Copy $_.FullName C:\NewDirectory\ }