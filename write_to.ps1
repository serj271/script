Write-Output 'My text' | Out-File -FilePath "$env:TEMP\Test.txt"
Write-Output 'Bob' | ForEach-Object {
    "My name is $_"
}