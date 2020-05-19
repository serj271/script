<#$Json = $Users | ConvertTo-Json
    Invoke-RestMethod -MethodPost -Uri "http://jsonplaceholder.typicode.com/users" -Body $Json 
    -ContentType 'application/json'#>

$Users = Invoke-RestMethod -Uri "http://jsonplaceholder.typicode.com/users"
Write-Output $Users
$Json = $Users | ConvertTo-Json
Write-Output $Json