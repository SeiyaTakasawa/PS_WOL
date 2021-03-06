﻿"セッション中のPCをシャットダウンします"

# Current移動
$currentPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $currentPath

# セッション開始
$beginSessionPath = $currentPath + "\\BeginSession.ps1"
powershell $beginSessionPath

# _SessionList.csvを読み込みます
$currentPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $currentPath
$sessionListPath = $currentPath + "\_SessionList.csv"
$sessionListCSV = Import-Csv $sessionListPath -Encoding Default #セッションリスト

# データ配列を作る
$arrayIPs = @()
$arrayUsers = @()
$arrayPWs = @()
$arrayFolders = @()
$sessionListCSV | ForEach-Object{
    $arrayIPs += $_.IP
    $arrayUsers += $_.User
    $arrayPWs += $_.PW
}

$num = $arrayIPs.length

# Shutdown
for($i = 0; $i -lt $num; $i++){ 
   $ping = Test-Connection $arrayIPs[$i] -Count 1 -Quiet

   if($ping){
    $message = "シャットダウンします"
    $shutdownCommand = "shutdown -m " + $arrayIPs[$i] + " -s -f -t 3" 
    Write-Host $shutdownCommand
    Invoke-Expression $shutdownCommand
   }

}
Write-Host "3秒後にシャットダウンします"

# セッション終了
$endSessionPath = $currentPath + "\\EndSession.ps1"
powershell $endSessionPath


