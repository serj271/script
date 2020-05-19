$dir = dir "C:\script"
$dir | Select-Object Name, FullName, Attributes
$dir | select Name, FullName, Attributes

Get-ChildItem "C:\script"| Select-Object FullName, Name,
@{Name='DateTime'; Expression={Get-Date}},
@{Name='PropertyName'; Expression={'CustomValue'}}
