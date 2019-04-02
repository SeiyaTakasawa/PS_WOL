"セッションを開始します"

# _SessionList.csvを読み込みます
$currentPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $currentPath
$sessionListPath = $currentPath + "\_SessionList.csv"
$sessionListCSV = Import-Csv $sessionListPath -Encoding Default #セッションリスト
$sessionListCSV

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
   $user = $arrayUsers[$i]
   $pass = $arrayPWs[$i]

   $ping = Test-Connection $ip -Count 1 -Quiet

   if($ping){

        Write-Host($server + ":" + $user)
        net use $server /user:$user $pass
        #explorer $server
 
   }
}
net use


