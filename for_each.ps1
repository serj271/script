$Names = @('Amy', 'Bob', 'Celine', 'David')

ForEach ($Name in $Names)
{
    Write-Host "Hi, my name is $Name!"
}

$Numbers = ForEach ($Number in 1..20) {
    $Number # Alternatively, Write-Output $Number
}

$Numbers = @()
ForEach ($Number in 1..20)
{
    $Numbers += $Number
}

(1..10).ForEach({$_ * $_})

$names = @("Any","Bob","Celine","David")
$names | ForEach-Object {
    "Hi, my name is $_!"
}

$names | % {
    "Hi, my name is $_!"
}
$names | foreach {
    "Hi, my name is $_!"
}

$i =0
while ($i -lt 20) {
$i++
if ($i -eq 7) { continue }
    Write-Host $I
}
$i = 0
:mainLoop While ($i -lt 15) {
    Write-Host $i -ForegroundColor 'Cyan'
    $j = 0
    While ($j -lt 15) {
    Write-Host $j -ForegroundColor 'Magenta'
    $k = $i*$j
    Write-Host $k -ForegroundColor 'Green'
    if ($k -gt 100) {
        break mainLoop
    }
        $j++
    }
    $i++
}

Start-Process notepad.exe
while(Get-Process notepad -ErrorAction SilentlyContinue){
    Start-Sleep -Milliseconds 500
}
switch -Exact ('Condition')
{
'condition' {'First Action'}
'Condition' {'Second Action'}
'conditioN' {'Third Action'}
'^*ondition$' {'Fourth Action'}
'Conditio*' {'Fifth Action'}
}