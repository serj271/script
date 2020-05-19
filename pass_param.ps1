$MyParameters = @{
    FileVersionInfo = $true
}
Get-Process @MyParameters -Name WmiPrvSE
Get-Process @MyParameters -Name explorer