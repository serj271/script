<#Sample text#>
$text = @"
This is (a) sample
text, this is
a (sample text)
"@
#Sample pattern: Content wrapped in ()
$pattern = '\(.*?\)'

$text -match $pattern

$textarray = @"
This is (a) sample
text, this is
a (sample text)
"@ -split "`n"

$textarray -match $pattern

$textarray | Select-String -Pattern $pattern

$textarray | Select-String -Pattern $pattern | fl *

[regex]::Match($text,$pattern)

[regex]::Match($text,$pattern) | Select-Object -ExpandProperty Value 


