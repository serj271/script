$User = $env:UserName
$FileName = "signature"
$FileExtension = "htm","rtf","txt"
$Path = "C:\Users\Public\Downloads"
$PathSignature = "$Path\OutlookSignature"
$PathSignatureTemplates = "$Path\OutlookSignature\Templates"
$PathSignatureUser = "$PathSignature\$User"
$AppSignatures =$env:APPDATA + "\Microsoft\Signatures"

<#Import-module activedirectory
$AD_user = Get-ADUser $User -Properties Title,Company,Description,Fax,HomePage,Mail,OfficePhone,PostalCode,City,StreetAddress#>
# create directory OutlookSignature
If(!(test-path "$PathSignature\$User")){
    New-Item -Path "$PathSignature\$User" -ItemType Directory
}
#New-Item -Path "$PathSignature\$User" -ItemType Directory

# create directory Templates
If(!(test-path $PathSignatureTemplates)){
    New-Item -Path "$PathSignatureTemplates" -ItemType Directory
}
#New-Item -Path "$PathSignatureTemplates" -ItemType Directory


#New-SmbShare -Name "DSCSMB" -Path "C:\DSCSMB" -ReadAccess Everyone  -FullAccess Administrator -Description "Smb share"
#Get-ChildItem "$Path" -Recurse  -Force| Remove-Item
<#If (Test-Path "$PathSignature")
{
 Remove-Item "$PathSignature"
}#>
#New-SmbShare -Name $PathSignature\$User -Path $PathSignature\$User -ReadAccess Everyone  -FullAccess user 
#$pwd.Path
foreach ($Ext in $FileExtension)
{
    Copy-Item -Force "C:\script\OutlookSignature\Templates\$FileName.$Ext" "$PathSignatureUser\$FileName.$Ext"
}
$newObject = New-Object -TypeName PSObject -Property @{
    Description = $env:username
    title = 'title'
    Company = $null
    STREETADDRESS = 'StreetAddress'
    POSTALCODE = 'POSTALCODE'
    CITY = 'Chelyabinsk'
    OFFICEPHONE = '12519'
    EMAIL = 'u0010345@che.mrsk-ural.ru'
    WEBSITE =  $null

}
foreach ($Ext in $FileExtension)
{
    (Get-Content "$PathSignatureUser\$FileName.$Ext") | Foreach-Object {
    $_`
    -replace "@NAME", $newObject.Description `
    -replace "@DESCRIPTION", $newObject.title `
    -replace "@COMPANY", $newObject.Company `
    -replace "@STREETADDRESS", $newObject.StreetAddress `
    -replace "@POSTALCODE", $newObject.PostalCode `
    -replace "@CITY", $newObject.City `
    -replace "@OFFICEPHONE", $newObject.OfficePhone `
    -replace "@EMAIL", $newObject.Mail `
    -replace "@WEBSITE", $newObject.Homepage `
    } | Set-Content "$PathSignatureUser\$FileName.$Ext"
}
#copy FileName
foreach ($Ext in $FileExtension)
{
    Copy-Item -Force "$PathSignatureUser\$FileName.$Ext" "$AppSignatures\$User.$Ext"
    write-host "$PathSignatureUser\$FileName.$Ext"
    write-host "$AppSignatures\$User.$Ext"
}


<#foreach ($Ext in $FileExtension)
{
(Get-Content "$PathSignatureUser\$FileName.$Ext") | Foreach-Object {
$_`
-replace "@NAME", $AD_user.Description `
-replace "@DESCRIPTION", $AD_user.title `
-replace "@COMPANY", $AD_user.Company `
-replace "@STREETADDRESS", $AD_user.StreetAddress `
-replace "@POSTALCODE", $AD_user.PostalCode `
-replace "@CITY", $AD_user.City `
-replace "@OFFICEPHONE", $AD_user.OfficePhone `
-replace "@EMAIL", $AD_user.Mail `
-replace "@WEBSITE", $AD_user.Homepage `
} | Set-Content "$PathSignatureUser\$FileName.$Ext"
}#>


#Office 2010
<#If (Test-Path HKCU:'\Software\Microsoft\Office\14.0') {
Remove-ItemProperty -Path HKCU:\Software\Microsoft\Office\14.0\Outlook\Setup -Name First-Run -Force -ErrorAction SilentlyContinue -Verbose
New-ItemProperty HKCU:'\Software\Microsoft\Office\14.0\Common\MailSettings' -Name 'ReplySignature' -Value $User -PropertyType 'String' -Force
New-ItemProperty HKCU:'\Software\Microsoft\Office\14.0\Common\MailSettings' -Name 'NewSignature' -Value $User -PropertyType 'String' -Force
}
#Office 2013
If (Test-Path HKCU:'\Software\Microsoft\Office\15.0') {
Remove-ItemProperty -Path HKCU:\Software\Microsoft\Office\15.0\Outlook\Setup -Name First-Run -Force -ErrorAction SilentlyContinue -Verbose
New-ItemProperty HKCU:'\Software\Microsoft\Office\15.0\Common\MailSettings' -Name 'ReplySignature' -Value $User -PropertyType 'String' -Force
New-ItemProperty HKCU:'\Software\Microsoft\Office\15.0\Common\MailSettings' -Name 'NewSignature' -Value $User -PropertyType 'String' -Force
}
#>







