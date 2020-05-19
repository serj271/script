<#Sample text#>
$text = @"
This is (a) sample
text, this is
a (sample text)
"@
#Sample pattern: Text wrapped in ()
$pattern = '\(.*?\)'
#Replace matches with:
$newvalue = 'test'

$text -replace $pattern, $newvalue


[regex]::Replace($text, $pattern, 'test')

