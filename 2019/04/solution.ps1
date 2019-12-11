[String[]]$PuzzleRange = [System.Collections.ArrayList]@(136760..595730)
[Int[]]$FirstFilteredRange = $PuzzleRange.Where({
    $_[0] -le $_[-1] -and 
    $_[0] -le $_[1] -and 
    $_[1] -le $_[2] -and 
    $_[2] -le $_[3] -and 
    $_[3] -le $_[4] -and 
    $_[4] -le $_[5]
})

[String[]]$FirstStepFilteredRange = $FirstFilteredRange


[Int[]]$SecondFilteredRange = $FirstStepFilteredRange.Where({
    $_[0] -eq $_[1] -or
    $_[1] -eq $_[2] -or 
    $_[2] -eq $_[3] -or 
    $_[3] -eq $_[4] -or 
    $_[4] -eq $_[5]
})

[String[]]$SecondStepFilteredRange = $SecondFilteredRange

[Int[]]$ThirdFilteredRange = $SecondStepFilteredRange.Where({
    $_[0] -eq $_[1] -or
    $_[1] -eq $_[2] -or 
    $_[2] -eq $_[3] -or 
    $_[3] -eq $_[4] -or 
    $_[4] -eq $_[5]
})


