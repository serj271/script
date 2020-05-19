# 1.) Output to the next Cmdlet in the pipeline
Write-Output 'My text' | Out-File -FilePath "$env:TEMP\Test.txt"

Write-Output 'Bob' | ForEach-Object {
    "My name is $_"
}
# 2.) Output to the console since Write-Output is the last command in the pipeline
Write-Output 'Hello world'
# 3.) 'Write-Output' CmdLet missing, but the output is still considered to be 'Write-Output''Hello world'