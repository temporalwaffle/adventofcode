$timer = New-Object System.Diagnostics.Stopwatch
$timer.Start()

$FileInput = @(Get-Content "$PSScriptRoot\input.txt")

$Path1 = @($FileInput[0]).Split(",")
$Path2 = @($FileInput[1]).Split(",")


function Get-Points {
    param(
        $path
    )
    $x = 0
    $y = 0
    $Points = @{}
    $DX = @{'L' = -1; 'R' = 1; 'U' = 0; 'D' = 0 }
    $DY = @{'L' = 0; 'R' = 0; 'U' = 1; 'D' = -1 }
    $Length = 0

    foreach ($dir in $path) {
        $distance = [int](-join $dir[1..($dir.Length)])
        [string]$direction = $dir[0]
        foreach ($i in (1..$distance)) {
            $x += $DX[$direction]
            $y += $DY[$direction]
            $length++
            $NextPoint = "$x,$y"
            if (!$Points.ContainsKey($NextPoint)) {
                $Points[$NextPoint] = $Length
            }
        }
    }

    Return $Points

}

$Points1 = Get-Points -Path $Path1
$Points2 = Get-Points -Path $Path2


$ints = $Points1.Keys | Where-Object { $Points2.ContainsKey($_) -and $_ -ne "0,0"} 

$sums = @()

foreach ($i in $ints){
    $h = $i -split ","
    $sums+= [Math]::Abs([int]$h[0]) + [Math]::Abs([int]$h[1])
}

$intWalks = $ints | % {$points1[$_] + $points2[$_]}

$minToCenter = ($sums | Measure-Object -Minimum).Minimum
$minWalkDistance = ($intWalks | Measure-Object -Minimum).Minimum
Write-Host "Part 1: $minToCenter"
Write-Host "Part 2: $minWalkDistance"

$timer.Stop()
Write-Host $timer.Elapsed