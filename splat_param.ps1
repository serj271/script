$MyParameters = @{
    Name = "firefox"
    FileVersionInfo = $true
}

Get-Process @MyParameters
#Without splatting:
Get-Process -Name "firefox" -FileVersionInfo

$MyParameters = @{
    ComputerName = "StackOverflow-PC"
}

Get-Process -Name "firefox" @MyParameters
Invoke-Command -ScriptBlock { "Something to execute remotely" } @MyParameters