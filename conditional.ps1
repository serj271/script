$test = "test"
if ($test -eq "test"){
Write-Host "if condition met"
}


$test = "test"
if ($test -eq "test2"){
    Write-Host "if condition met"
}
else{
    Write-Host "if condition not met"
}

$test = "test"
if ($test -eq "test2"){
    Write-Host "if condition met"
}
elseif ($test -eq "test"){
    Write-Host "ifelse condition met"
}

$test = "test"
if (-Not $test -eq "test2"){
    Write-Host "if condition not met"
}