$names = @( "Aaron", "Aaron", "Bernie", "Charlie", "Danny" )

$names | Sort-Object
$names | sort

$names | Sort-Object -Descending
$names | sort -Descending

$names | Sort-Object { $_.length }

