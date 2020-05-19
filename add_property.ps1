$object = New-Object -TypeName PSObject -Property @{
    Name = $env:username
    ID = 12
    Address = $null
}
Add-Member -InputObject $object -Name "SomeNewProp" -Value "A value" -MemberType NoteProperty

$Object

$newObject = $Object | Select-Object *, @{label='SomeOtherProp'; expression={'Another value'}}

$newObject

$object = $newObject | Select-Object * -ExcludeProperty ID, Address

$object

$newObject = New-Object -TypeName PSObject -Property @{
    Name = $env:username
    ID = 12
    Address = $null
}
$newObject

$newCollection = @()
$newCollection += New-Object -TypeName PSObject -Property @{
    Name = $env:username
    ID = 12
    Address = $null
}









