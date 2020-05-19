function Write-FromPipeline {
    param(
        [Parameter(ValueFromPipeline)] # This sets the ParameterAttribute
        [String]$Input
    )

    Write-Host $Input
}

$foo = 'Hello World!'
$foo | Write-FromPipeline

