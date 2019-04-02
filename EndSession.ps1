"セッションを終了します"

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
    $arrayFolders += $_.Folder
}

$num = $arrayIPs.length

for($i = 0; $i -lt $num; $i++){
   $ip = $arrayIPs[$i]
   $server = "\\" + $ip
   $folder = $server + "\" + $arrayFolders[$i]
   $ping = Test-Connection $ip -Count 1 -Quiet

   if($ping){
            Write-Host $server "を削除します"
            net use $server /delete
      
   }  
}

net use
