
<#param(
    [ValidateScript({
        $AnHourAgo = (Get-Date).AddHours(-1)
        if ($_ -lt $AnHourAgo.AddMinutes(5) -and $_ -gt $AnHourAgo.AddMinutes(-5)) {
            $true
        } else {
            throw "That's not within five minutes. Try again."
        }
    })]
    [String]$TimeAboutAnHourAgo
)#>

function Get-Greeting{
    param
    (
        [Parameter(Mandatory=$true)]$name
    )
    "Hello World $name"
}

Get-Greeting 'John'

function get-color{
    param
    (
        [ValidateSet('red','green','blue',IgnoreCase)]
        [string]$Color
    )
    "Hello string $Color"
}

get-color 'red'
#get-color 'none'

function test_path{
    param
    (
        [ValidateScript({Test-Path $_})]
        [IO.FileInfo]$Path
    )
    "Hello path $Path"
}

test_path "C:\script\hello.ps1"





