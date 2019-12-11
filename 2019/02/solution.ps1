function Get-PuzzleInput {
    [int[]]$InputArray = (Get-Content "$PSScriptRoot\input.txt") -split ','
    $InputArray
}


function Invoke-Intcode {
    [CmdletBinding()]
    param (
        [parameter(Mandatory)]
        [int[]]
        $OpCodes
    )
    
    begin {
        $Memory = $Opcodes
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
                    # Write-Error "Invalid op code $_ at $Position."
                    return
                }
            } 
        } until ($Memory[$Position] -eq 99)
        return [PSCustomObject]@{ 
                                Memory = $Memory; 
                                FinalPosition = $Position 
                            }
    }
}

# $test = Get-PuzzleInput
# Invoke-Intcode -OpCodes $test
# $run.Memory[0]

function Invoke-IntcodeSolver ($Noun, $Verb){
    $PuzzleInput = Get-PuzzleInput
    $PuzzleInput[1] = $Noun
    $PuzzleInput[2] = $Verb
    $Output = Invoke-Intcode -OpCodes $PuzzleInput
    Return $Output.Memory[0]
}



# Invoke-IntcodeSolver -Noun 12 -Verb 2
# Invoke-IntcodeSolver -Noun 0 -Verb 0
# Invoke-IntcodeSolver
    
    for ($i = 0; $i -le 99; $i++) {
        for ($j = 0; $j -le 99; $j++){
            # Write-Output "Noun of $i and Verb of $j being used"
            $BruteForce = Invoke-IntcodeSolver -Noun $i -Verb $j
            if ($BruteForce -eq 19690720){
                return Write-Output (100 * $i + $j)
            }
            
        }
    }
    



# Keyterms
# Address
# Memory
# Parameters
# Instruction
# $Memory = $InputArray

# $Address = 0

# $Memory[$Address]

# $Opcodes = @(1,2,99)


# $Opcode = 0
# $Parameter1 = $Opcode+1
# $Parameter2 = $Opcode+2
# $Parameter3 = $Opcode+3

# $Instruction = @($Opcode, $Parameter1, $Parameter2, $Parameter3)
# $InstructionIncrement = $Instruction.Count

# $InstructionPointer = 0 
# $InstructionPointer = $InstructionPointer + $InstructionIncrement

