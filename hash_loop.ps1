$hashTable = @{
    Key1 = 'Value1'
    Key2 = 'Value2'

}

foreach($key in $hashTable.Keys)
{
    $value = $hashTable.$key
    Write-Output "$key : $value"
}
