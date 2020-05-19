$hashTable = @{
    Key1 = 'Value1'
    Key2 = 'Value2'
}
$hashTable.Key1

$hashTable = @{
'Key 1' = 'Value3'
Key2 = 'Value4'
}
$hashTable.'Key 1'

$hashTable = @{}

$hashTable = @{
Name1 = 'Value'
Name2 = 'Value'
Name3 = 'Value3'
}

$hashTable = @{
Key1 = 'Value1'
}
$hashTable += @{Key2 = 'Value2'}
$hashTable

$hashTable = @{
Key1 = 'Value1'
Key2 = 'Value2'
}
$hashTable.Remove("Key2", "Value2")
$hashTable

foreach($key in $hashTable.Keys)
{
$value = $hashTable.$key
Write-Output "$key : $value"
}
#Output

