$DebloatFolder = "C:\ProgramData\Debloat"
If (Test-Path $DebloatFolder) {
    Write-Output "$DebloatFolder exists. Skipping."
}
Else {
    Write-Output "The folder '$DebloatFolder' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "$DebloatFolder" -ItemType Directory
    Write-Output "The folder $DebloatFolder was successfully created."
}

$templateFilePath = "C:\ProgramData\Debloat\debloat.ps1"

Invoke-WebRequest `
-Uri "https://raw.githubusercontent.com/crysalead/public/master/debloat/debloat.ps1" `
-OutFile $templateFilePath `
-UseBasicParsing `
-Headers @{"Cache-Control"="no-cache"}


##Populate between the speechmarks any apps you want to whitelist, comma-separated
$arguments = ' -customwhitelist "Microsoft.OneDriveSync"'


invoke-expression -Command "$templateFilePath $arguments"
