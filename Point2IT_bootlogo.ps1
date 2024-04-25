##Elevate if needed

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
    Start-Sleep 1
    Write-Host "                                               3"
    Start-Sleep 1
    Write-Host "                                               2"
    Start-Sleep 1
    Write-Host "                                               1"
    Start-Sleep 1
    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`" -WhitelistApps {1}" -f $PSCommandPath, ($WhitelistApps -join ',')) -Verb RunAs
    Exit
}

$FolderPath = "C:\Bootlogo"
 
If(Get-ChildItem -Path $FolderPath -Force -ErrorAction SilentlyContinue)
{
    Write-Host "Folder already Exists!"
}
else
{
    #PowerShell Create directory if not exists
    New-Item $FolderPath -ItemType Directory
     
    Write-Host "New Folder Created!"
}

$source = "https://raw.githubusercontent.com/ServicedeskPoint2IT/Intune/main/Point2IT%20logo.jpeg"
$destination = "C:\Bootlogo\Point2ITboot.jpeg"
Invoke-WebRequest $source -OutFile $destination

Set-HPFirmwareBootLogo -file C:\Bootlogo\Point2ITboot.jpeg
