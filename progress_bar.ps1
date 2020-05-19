1..100 | ForEach-Object {
    Write-Progress -Activity "Copying files" -Status "$_ %" -Id 1 -PercentComplete $_ -CurrentOperation 
    "Copying file file_name_$_.txt"
    Start-Sleep -Milliseconds 500 # sleep simulates working code, replace this line with
   <# your executive code (i.e. file copying)#>
}