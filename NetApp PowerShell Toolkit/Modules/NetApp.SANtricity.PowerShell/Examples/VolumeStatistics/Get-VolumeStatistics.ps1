
param
(
    [int]$Wait=30, 
    [array]$VolumeNames=@("SANtricity-PoSH-Vol-1","SANtricity-PoSH-Vol-2","SANtricity-PoSH-Vol-3") 
)

if ($ss -eq $null) { ..\Set-DiTEnv.ps1 }

$Stop = $false
$LastWriteOps=0
$LastReadOps=0
$LastWriteTime=0
$LastReadTime=0
$LastWriteHitTimeTotal=0
$LastReadHitTimeTotal=0
$FirstTime=$true
do {
    $RawStats = Get-NeAnalysedVolumeStatistics @c |? {$_.volumename -in $VolumeNames } #|fl -Property VolumeName,WriteOps,WriteTimeTotal,WriteHitTimeTotal,ReadOps,ReadTimeTotal,ReadHitTimeTotal
    if (-not $FirstTime) {
        foreach ($StatLine in $RawStats) {
            #$CurrentWriteOps = ($StatLine.WriteOps - $LastWriteOps)
            #$CurrentReadOps = $StatLine.ReadOps - $LastReadOps
            #$CurrentWriteTime = $StatLine.WriteTimeTotal - $LastWriteTime 
            #$CurrentReadTime = $StatLine.ReadTimeTotal - $LastReadTime 
            #$CurrentReadHitTimeTotal = $StatLine.ReadHitTimeTotal - $LastReadHitTimeTotal
            #$CurrentWriteHitTimeTotal = $StatLine.WriteHitTimeTotal - $LastWriteHitTimeTotal
            #$output="$(Get-Date -Format "yyyy-MM-dd HH:mm:ss"),${CurrentWriteOps},$($StatLine.WriteOps),${CurrentReadOps},$($StatLine.ReadOps),${CurrentWriteTime},$($StatLine.WriteTimeTotal),${CurrentReadTime},$($StatLine.ReadTimeTotal),${CurrentReadHitTimeTotal},$($StatLine.ReadHitTimeTotal),${CurrentWriteHitTimeTotal},$($StatLine.WriteHitTimeTotal)"
            $CombinedIOPs= $StatLine.WriteIOPs + $StatLine.ReadIOPs
            $output="$(Get-Date -Format "yyyy-MM-dd HH:mm:ss"),$($StatLine.VolumeName),$($StatLine.WriteIOps),$($StatLine.ReadIOps),$CombinedIOPs,$($StatLine.WriteResponseTime)"
            $output 
            $output |Out-File -FilePath "Stats.csv" -Append
        }
    } else { $FirstTime = $false }

    $LastWriteOps = $RawStats.WriteOps
    $LastReadOps = $RawStats.ReadOps
    $LastWriteTime = $RawStats.WriteTimeTotal
    $LastReadTime = $RawStats.ReadTimeTotal
    $LastReadHitTimeTotal = $RawStats.ReadHitTimeTotal
    $LastWriteHitTimeTotal = $RawStats.WriteHitTimeTotal

    Start-Sleep $Wait
} while ($Stop -ne $true )