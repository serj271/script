$splat = @{
    Class = "Win32_SystemEnclosure"
    Property = "Manufacturer"
    ErrorAction = "Stop"
}
Get-WmiObject -ComputerName $env:COMPUTERNAME @splat
Get-WmiObject -ComputerName "Computer2" @splat
Get-WmiObject -ComputerName "Computer3" @splat

@{
    ComputerName = $env:COMPUTERNAME
    Class = "Win32_SystemEnclosure"
    Property = "Manufacturer"
    ErrorAction = "Stop"
} | % { Get-WmiObject @_ }