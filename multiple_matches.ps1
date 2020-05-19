#Sample text
$text = @"
This is (a) sample
text, this is
a (sample text)
"@
#Sample pattern: Content wrapped in ()
$pattern = '\(.*?\)'

$m = Select-String -InputObject $text -Pattern $pattern -AllMatches

$m | Format-List *

$m.Matches | Select-Object -ExpandProperty Value

[regex]::Matches($text,$pattern) | Select-Object -ExpandProperty Value
