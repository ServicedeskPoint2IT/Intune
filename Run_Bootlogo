$BootlogoFolder = "C:\ProgramData\Bootlogo"
If (Test-Path $DebloatFolder) {
    Write-Output "$DebloatFolder exists. Skipping."
}
Else {
    Write-Output "The folder '$BootlogoFolder' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "$BootlogoFolder" -ItemType Directory
    Write-Output "The folder $BootlogoFolder was successfully created."
}

$templateFilePath = "C:\ProgramData\Bootlogo\Point2IT_bootlogo.ps1"

Invoke-WebRequest `
-Uri "https://raw.githubusercontent.com/ServicedeskPoint2IT/Intune/main/Point2IT_bootlogo.ps1" `
-OutFile $templateFilePath `
-UseBasicParsing `
-Headers @{"Cache-Control"="no-cache"}


##Populate between the speechmarks any apps you want to whitelist, comma-separated
$arguments = ' -customwhitelist ""'


invoke-expression -Command "$templateFilePath $arguments"
