$foo = "Global Scope"

function myFunc {
    $foo = "Function (local) scope"
    Write-Host $global:foo
    Write-Host $local:foo
    Write-Host $foo
}

myFunc
Write-Host $local:foo
Write-Host $foo