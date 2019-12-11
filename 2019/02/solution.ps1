[int[]]$InputArray = (Get-Content "$PSScriptRoot\input.txt") -split ','

$InputArray[1] = 12
$InputArray[2] = 2

function Invoke-Intcode {
    [CmdletBinding()]
    param (
        [parameter(Mandatory)]
        [int[]]
        $OpCodes
    )
    
    begin {
        $Memory = $InputArray
    }
    
    process {
        
    }
    
    end {
        $Position = 0
        do {
            switch ($Memory[$Position]){
                1 {
                    $Memory[$Memory[$Position+3]] = $Memory[$Memory[$Position+1]] + $Memory[$Memory[$Position+2]]
                    $Position = $Position + 4
                }
                2 {
                    $Memory[$Memory[$Position+3]] = $Memory[$Memory[$Position+1]] * $Memory[$Memory[$Position+2]]
                    $Position = $Position + 4
                }
                99 {
                    Write-Output "99, program complete."
                }
                Default {
                    Write-Error "Invalid op code $_ at $Position."
                    return
                }
            } 
        } until ($Memory[$Position] -eq 99)
        return [PSCustomObject]@{
                Memory = $Memory[0]
                FinalPosition = $Position
                 }
    }
}

Invoke-Intcode -OpCodes $InputArray

# Keyterms
# Address
# Memory
# Parameters
# Instruction
$Memory = $InputArray

$Address = 0

$Memory[$Address]

$Opcodes = @(1,2,99)


$Opcode = 0
$Parameter1 = $Opcode+1
$Parameter2 = $Opcode+2
$Parameter3 = $Opcode+3

$Instruction = @($Opcode, $Parameter1, $Parameter2, $Parameter3)
$InstructionIncrement = $Instruction.Count

$InstructionPointer = 0 
$InstructionPointer = $InstructionPointer + $InstructionIncrement

