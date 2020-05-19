Function Outer-Method
{
    Param
    (
        [string]
        $First,
        [string]
        $Second
    )
    Write-Host ($First) -NoNewline
    Inner-Method @PSBoundParameters
}
Function Inner-Method
{
    Param
    (
        [string]
        $Second
    )
    Write-Host (" {0}!" -f $Second)
}

$parameters = @{
    First = "Hello"
    Second = "World"
}

Outer-Method @parameters