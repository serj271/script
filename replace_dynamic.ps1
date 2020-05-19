#Sample text
$text = @"
    This is (a) sample
    text, this is
    a (sample text)
"@
#Sample pattern: Content wrapped in ()
$pattern = '(?<=\().*?(?=\))'
$MatchEvalutor = {
    param($match)
    #Replace content with length of content
    $match.Value.Length
}

[regex]::Replace($text, $pattern, $MatchEvalutor)

#Sample pattern: "Sample"
$text = @"
    This is (a) sample
    text, this is
    a (sample text)
"@

$pattern = 'sample'
$MatchEvalutorU = {
    param($match)
    #Return match in upper-case
    $match.Value.ToUpper()
}

[regex]::Replace($text, $pattern, $MatchEvalutorU)
