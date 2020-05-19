$myInput = 0
switch($myInput) {
    # because the result of the expression, 4,
    # does not equal our input this block should not be run.
    (2+2) { 'True. 2 +2 = 4' }
    # because the result of the expression, 0,
    # does equal our input this block should be run.
    (2-2) { 'True. 2-2 = 0' }
    # because our input is greater than -1 and is less than 1
    # the expression evaluates to true and the block should be run.
    { $_ -gt -1 -and $_ -lt 1 } { 'True. Value is 0' }
}
#Output