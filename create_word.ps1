$oWord = New-Object -Com Word.Application
$oWord.Visible = $true

$oMissing = [System.Reflection.Missing]::Value
$oDoc = $oWord.Documents.Add($oMissing, $oMissing, $oMissing, $oMissing)

$oPara1 = $oDoc.Paragraphs.Add($oMissing)
$oPara1.Range.Style = "Heading1"
$oPara1.Range.Text = "Insert a Paragraph with PowerShell"
$oPara1.Range.InsertParagraphAfter()

$oPara2 = $oDoc.Paragraphs.Add($oMissing)
$oPara2.Range.Text = "Microsoft Word automation is simple with PowerShell"
$oPara2.Range.InsertParagraphAfter()

$filename = 'C:\script\PowerShell.doc'
$oDoc.SaveAs($filename,
$oMissing, $oMissing,
$oMissing, $oMissing,
$oMissing, $oMissing,
$oMissing, $oMissing,
$oMissing, $oMissing)
$oDoc.Close()
$oWord.Quit()





