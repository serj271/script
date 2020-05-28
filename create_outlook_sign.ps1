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
# create directory signature
If(!(test-path $AppSignatures)){
    New-Item -Path "$AppSignatures" -ItemType Directory
}

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
    Copy-Item -Force "OutlookSignature\Templates\$FileName.$Ext" "$PathSignatureUser\$FileName.$Ext"
}

$objDomain = New-Object System.DirectoryServices.DirectoryEntry
$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.SearchRoot = $objDomain

$objSearcher.Filter =("(&(objectclass=user)(objectcategory=person)(useraccountcontrol:1.2.840.113556.1.4.803:=512)(samaccountname=$env:username))")
$objSearcher.PropertiesToLoad.Add("displayName")
$objSearcher.PropertiesToLoad.Add("sAMAccountName")
$objSearcher.PropertiesToLoad.Add("telephoneNumber");
$objSearcher.PropertiesToLoad.Add("streetAddress");
$objSearcher.PropertiesToLoad.Add("sAMAccountType");
$objSearcher.PropertiesToLoad.Add("company");
$objSearcher.PropertiesToLoad.Add("description");
$objSearcher.PropertiesToLoad.Add("mail");
 $item = $objSearcher.FindOne()


<#$newObject = New-Object -TypeName PSObject -Property @{
    displayname = $env:username
    description = 'description'            
    company = $null
    streetAddress = 'streetAddress'
    telephoneNumber = '12519'
    mail = 'u0010345@che.mrsk-ural.ru']]

}
#>
foreach ($Ext in $FileExtension)
{
    (Get-Content "$PathSignatureUser\$FileName.$Ext") | Foreach-Object {
    $_`
    -replace "@NAME", $item.Properties['displayname'] `
    -replace "@DESCRIPTION", $item.Properties['description'] `
    -replace "@COMPANY",$item.Properties['company'] `
    -replace "@STREETADDRESS",$item.Properties['streetAddress'] `
    -replace "@OFFICEPHONE", $item.Properties['telephoneNumber']`
    -replace "@EMAIL", $item.Properties['mail'] `
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
}#>

#Office 2016
<#If (Test-Path HKCU:'\Software\Microsoft\Office\16.0') {
Remove-ItemProperty -Path HKCU:\Software\Microsoft\Office\16.0\Outlook\Setup -Name First-Run -Force -ErrorAction SilentlyContinue -Verbose
New-ItemProperty HKCU:'\Software\Microsoft\Office\16.0\Common\MailSettings' -Name 'ReplySignature' -Value $User -PropertyType 'String' -Force
New-ItemProperty HKCU:'\Software\Microsoft\Office\16.0\Common\MailSettings' -Name 'NewSignature' -Value $User -PropertyType 'String' -Force
}
#>







