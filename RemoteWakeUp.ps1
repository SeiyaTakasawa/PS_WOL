 Write-Output "Remote WakeUp";
# mv Current
$currentPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $currentPath

function Send-WOL
{
    [CmdletBinding()]
    param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$mac,
    [string]$ip="255.255.255.255", 
    [int]$port=9
    )
    $broadcast = [Net.IPAddress]::Parse($ip)
 
    $mac=(($mac.replace(":","")).replace("-","")).replace(".","")
    $target=0,2,4,6,8,10 | % {[convert]::ToByte($mac.substring($_,2),16)}
    $packet = (,[byte]255 * 6) + ($target * 16)
 
    $UDPclient = new-Object System.Net.Sockets.UdpClient
    $UDPclient.Connect($broadcast,$port)
    [void]$UDPclient.Send($packet, 102) 
}

# Load _SessionList.csv
$currentPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $currentPath
$sessionListPath = $currentPath + "\_SessionList.csv"
$sessionListCSV = Import-Csv $sessionListPath -Encoding Default 

# make data arrays
$arrayIPs = @()
$arrayUsers = @()
$arrayPWs = @()
$arrayFolders = @()
$arrayMACs = @()
$sessionListCSV | ForEach-Object{
    $arrayIPs += $_.IP
    $arrayUsers += $_.User
    $arrayPWs += $_.PW
    $arrayMACs += $_.MAC 
}

$num = $arrayIPs.length

# WakeUp
for($i = 0; $i -lt $num; $i++){ 
   Write-Host "Wake On LAN " $arrayIPs[$i] "MAC address("  $arrayMACs[$i] ")"
   Send-WOL -mac $arrayMACs[$i]
}
