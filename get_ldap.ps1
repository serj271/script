Function Get-LDAPObject { 

param(
    [string]$LDAPServer="ldap.university.edu",
    [int]$LDAPPort=389,
    [boolean]$SSL=$false,
    [string]$baseDN="",
    [string]$Filter="(|(uid=**)"
)

$TitlecaseValues="displayname","givenname","sn","title","campus","project","school","department"
$UppercaseValues="building"
$IgnoreValues="pgp","objectclass"

[System.Reflection.Assembly]::LoadWithPartialName("System.DirectoryServices.Protocols") | Out-Null
[System.Reflection.Assembly]::LoadWithPartialName("System.Net") | Out-Null

$c = New-Object System.DirectoryServices.Protocols.LdapConnection "$($LDAPServer):$($LDAPPort)"
$c.SessionOptions.SecureSocketLayer = $SSL;
$c.AuthType = [System.DirectoryServices.Protocols.AuthType]::Anonymous

$scope = [System.DirectoryServices.Protocols.SearchScope]::Subtree
$attrlist = ,"*"
$r = New-Object System.DirectoryServices.Protocols.SearchRequest -ArgumentList $baseDN,$Filter,$scope,$attrlist
$re = $c.SendRequest($r);

If ($re.Entries.Count -eq 0) {
    return $null
} else {
    $output = @(0) * ($Re.Entries).count
    $i = 0

    foreach ($item in $Re.Entries) {
        $baseItem = [ordered]@{}
        $baseItem.distinguishedname = $item.DistinguishedName

        write-output $item.attributes.psbase

        foreach ($attribute in $item.attributes.GetEnumerator()) {
            $attribname = $attribute.Key
            $attribvalue = $attribute.Value.Item(0)

            If ($IgnoreValues -notcontains $attribname) {
                If ($TitlecaseValues -contains $attribname) {
                    $attribvalue = (Get-Culture).textinfo.totitlecase($attribvalue.toLower())
                } 
                ElseIF ($UppercaseValues -contains $attribname) {
                    $attribvalue = $attribvalue.ToUpper()
                } 

                $baseItem.$($AttribName) = $AttribValue
            }
        }

        $output[$i] = New-Object -TypeName psobject -Property $baseItem
        $i += 1

    }

    return $output

    }

}

# EXAMPLE:
#Get-LDAPObject -LDAPServer "ldap.university.edu" -LDAPPort 389 -SSL $false -Filter "(|(uid=*jsmith*)(displayname=*jsmith*)(cn=*jsmith*)(sn=*jsmith*))"
#Get-LDAPObject -LDAPServer "ldap.university.edu" -LDAPPort 389 -SSL $false -Filter "(|(officephone=*67890*))"


$LDAPSearchRoot = [System.DirectoryServices.DirectoryEntry]::new($LDAPUri,$LDAPUserName,$LDAPPassword)
$LDAPSearcher = [System.DirectoryServices.DirectorySearcher]::new($LDAPSearchRoot)
$LDAPSearcher.Filter = "(&(objectCategory=User))"
$LDAPSearcher.SizeLimit = 0
$LDAPSearcher.PageSize = 250
$UserObjectsInLDAP = $LDAPSearcher.FindAll() | foreach {$_.GetDirectoryEntry()}
$UserObjectsInLDAP[0] | fl *

