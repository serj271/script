function bar1 {
[System.Collections.ArrayList]$MyVariable = @()
    $MyVariable.Add("a") | Out-Null
    $MyVariable.Add("b") | Out-Null
    Return $MyVariable
}

function bar
{
    # New-Item cmdlet returns information about newly created file/folder
    New-Item "test1.txt" | out-null
    New-Item "test2.txt" > $null
    [void](New-Item "test3.txt")
    $tmp = New-Item "test4.txt"
}
bar1
