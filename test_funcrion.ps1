<#Function Test-Function
{
    Param
    (
        [switch]$ExceptionalReturn
    )
    "Start"
    if($ExceptionalReturn){Return "Damn, it didn't work!"}
    New-ItemProperty -Path "HKCU:\" -Name "test" -Value "TestValue" -Type "String"

    Return "Yes, it worked!"
}

Test-Function
Test-Function -ExceptionalReturn#>

Function Test-Function
{
    Param
    (
        [switch]$ExceptionalReturn
    )
    {
        "Start"
        if($ExceptionalReturn)
        {
            $Return = "Damn, it didn't work!"
            Return
        }
        New-ItemProperty -Path "HKCU:\" -Name "test" -Value "TestValue" -Type "String"
        $Return = "Yes, it worked!"
        Return
    } | Out-Null
    Return $Return
}
Test-Function

Test-Function -ExceptionalReturn









