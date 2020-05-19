function Verb-Noun {
    [CmdletBinding()]
    [OutputType([int])]
    Param(
        # Param1 help description
        [Parameter(Mandatory=$true,
        ValueFromPipelineByPropertyName=$true,
        Position=0)]
        $Param1,
        # Param2 help description
        [int]
        $Param2
    )

    Begin
    {

    }
    Process
    {

    }
    End
    {
        
    }

}




function HelloWorld {
    Write-Host "Greetings from PowerShell!"
}


HelloWorld
