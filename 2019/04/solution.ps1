# Part 1 Requirements:
# It is a six-digit number.
# The value is within the range given in your puzzle input.
# Two adjacent digits are the same (like 22 in 122345).
# Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).
# 
# Other than the range rule, the following are true:
# 
# 111111 meets these criteria (double 11, never decreases).
# 223450 does not meet these criteria (decreasing pair of digits 50).
# 123789 does not meet these criteria (no double).



function Get-PuzzleInput {
    [String[]]$PuzzleRange = [System.Collections.ArrayList]@(136760..595730)
    $PuzzleRange
}

function Get-FirstFilteredRange {
    $PuzzleRange = Get-PuzzleInput
    [Int[]]$FirstFilteredRange = $PuzzleRange | 
        Where-Object {(
            $_.Length -eq 6
        )} |
        Where-Object {(
        $_[0] -le $_[-1] -and 
        $_[0] -le $_[1] -and 
        $_[1] -le $_[2] -and 
        $_[2] -le $_[3] -and 
        $_[3] -le $_[4] -and 
        $_[4] -le $_[5])} | 
        Where-Object {(
        $_[0] -eq $_[1] -or
        $_[1] -eq $_[2] -or 
        $_[2] -eq $_[3] -or 
        $_[3] -eq $_[4] -or 
        $_[4] -eq $_[5])} | 
        Where-Object {(    
        $_[0] -eq $_[1] -or
        $_[1] -eq $_[2] -or 
        $_[2] -eq $_[3] -or 
        $_[3] -eq $_[4] -or 
        $_[4] -eq $_[5] )}
        
        $FirstFilteredRange
    }




# $Part1 = Get-FirstFilteredRange

# $Part1.Count



# Part 2 Requirements:
# An Elf just remembered one more important detail: the two adjacent matching digits are not part of a larger group of matching digits.

# Given this additional criterion, but still ignoring the range rule, the following are now true:

# 112233 meets these criteria because the digits never decrease and all repeated digits are exactly two digits long.
# 123444 no longer meets the criteria (the repeated 44 is part of a larger group of 444).
# 111122 meets the criteria (even though 1 is repeated more than twice, it still contains a double 22).


# function Get-SecondFilteredRange {
#     [String[]]$FirstFilteredRange = Get-FirstFilteredRange
#     foreach ($item in $FirstFilteredRange) {
#         foreach ($element in $item[0..5]) {
#             Write-Output $element
#         }
        
#     }

# }

# Get-SecondFilteredRange



function Get-TestSecondFilteredRange ($number) {
    $value = $false
    # [string[]]$PuzzleRange = Get-FirstFilteredRange
    $item = $number.ToString()
    for ($element=0; 0..5; $element++) {
        Write-Output $element
        if ($item[$element] -eq $item[$element+1]) {
            if ($element -le 3){
                if($item[$element+1] -ne $item[$element+2]){
                    if($element -ge 1){
                        if($item[$element] -ne $item[$element-1]){
                            $Value = $true
                        }
                    }else {
                        $Value = $true
                    }
                }
            }else {
                if ($item[$element] -ne $item[$element-1]) {
                    $value = $true
                }
            }
            
        }
    $value
    }
}

# Get-TestSecondFilteredRange -number 334455

# $Part2 = Get-SecondFilteredRange
# $Part2.Count


# function Get-Duplicates ($num1) {
#     $value = $false
#     $array1 = [string[]]$num1
#     for ($i = 0; $i -le 5; $i++) {
#         if($array1[$i] -eq $array1[$i+1]){
#             if($i -le 3){
#                 if($array1[$i+1] -ne $array1[$i+2]){
#                     if($i -ge 1){
#                         if($array1[$i] -ne $array1[$i-1]){
#                             $value = $true
#                             }
#                         }else {
#                             $value = $true
#                         }
#                     }
#                 }else {
#                     if($array1[$i] -ne $array1[$x-1]){
#                         $value = $true
#                     }
#                 }
#             }
#         }
#     return $value
# }





# def findDupes(num1):
#     value = False
#     array1 = list(str(num1))
#     for x in range(0,5):
#         if(array1[x]==array1[x+1]):
#             if(x<=3):
#                 if(array1[x+1]!=array1[x+2]):
#                     if(x>=1):
#                         if(array1[x]!=array1[x-1]):
#                             value = True
#                     else:
#                         value = True
#             else:
#                 if(array1[x]!=array1[x-1]):
#                     value = True
#     return value



function Get-Down ($number){
    $value = $true
    $item = $number.ToString()
    for ($i = 0; 0..5; $i++) {
        Write-Output $item[$i]
        if ($item[$i] -gt $item[$i+1]) {
            $value = $false
            break
        }
    }
    $value
}


# Get-Down -number 123456


#function to return true if non-decreasing adjacent numbers
# def findDown(num1):
#     value = True
#     array1 = list(str(num1))
#     for x in range(0,5):
#         if(array1[x]>array1[x+1]):
#             value = False
#             break
#     return value

# count = 0;
$count = 0


for ($i = 136760; $i -le 595730 ; $i++) {
    Write-Output $i
    $Dupe = Get-TestSecondFilteredRange -number $i
    $Down = Get-Down -number $i
    if($Dupe -and $Down -eq $true){
        $count +=1
        Write-Output $count
    }
}


#loop to run through the range
# for i in range(183564,657475):
#     if(findDupes(i) and findDown(i)):
#         count += 1

# print("The number of possible correct passwords is: " + str(count))

# Write-Output "The number of possible correct passwords is: $count"