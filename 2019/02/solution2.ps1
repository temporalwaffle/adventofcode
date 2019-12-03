[int[]]$InputArray = (Get-Content "$PSScriptRoot\input.txt") -split ','

$InputArray[1] = 12
$InputArray[2] = 2

$Memory = $InputArray

$Address = 0


$Opcodes = @(1,2,99)


$Opcode = 0
$Parameter1 = $Opcode+1
$Parameter2 = $Opcode+2
$Parameter3 = $Opcode+3

$Instruction = @($Opcode, $Parameter1, $Parameter2, $Parameter3)
$InstructionIncrement = $Instruction.Count

$InstructionPointer = $Memory[$Address]
$InstructionPointer = $InstructionPointer + $InstructionIncrement

do {
    switch ($Memory[$Address]) {
        1 { Write-Output "One, Opcode = Addition"
            $Memory[$Memory[$Address+3]] = $Memory[$Memory[$Address+1]] + $Memory[$Memory[$Address+2]]
            $Address =  $Address + $InstructionIncrement 
        }
        2 { Write-Output "Two, Opcode = Multiplication"
            $Memory[$Memory[$Address+3]] = $Memory[$Memory[$Address+1]] * $Memory[$Memory[$Address+2]]
            $Address =  $Address + $InstructionIncrement 
        }
        99 { Write-Output "Ninety nine, program complete" }
        Default {Write-Output "Invalid Opcode"; Return}
    }
} until ($Memory[$Address] -eq 99)
return [PSCustomObject]@{
    Memory = $Memory[0]
    FinalPosition = $Address
     }


Write-Output $Memory[$Address]
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output $Memory[$Address+1]
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output $Memory[$Address+2]
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output $Memory[$Address+3]
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output "|"
Write-Output $Memory[0]

