#LOOP WOL

# Current移動
$currentPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $currentPath



$sleepingDuration = 5
$i = 1
while ($i -lt 6) {
 
    Write-Output "$i　回目のWOL";

    #WOL
    $beginWakeUpPath = $currentPath + "\\RemoteWakeUp.ps1"
    powershell $beginWakeUpPath

    Start-Sleep $sleepingDuration
    $i ++
}