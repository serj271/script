
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

$newObject = 'unuseddummy' | Select-Object -Property Name, ID, Address
$newObject.Name = $env:username
$newObject.ID = 12