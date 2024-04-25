
$FolderPath = "C:\Beheer"
 
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

$source = "https://raw.githubusercontent.com/ServicedeskPoint2IT/WinDeBloat/main/Point2IT%20logo.jpeg"
$destination = "C:\Beheer\Point2ITboot.jpeg"
Invoke-WebRequest $source -OutFile $destination

Set-HPFirmwareBootLogo -file C:\Beheer\Point2ITboot.jpeg