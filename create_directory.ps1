New-Item -Path "C:\DSCSMB" -ItemType Directory
New-SmbShare -Name "DSCSMB" -Path "C:\DSCSMB" -ReadAccess Everyone  -FullAccess Administrator -Description "Smb share"