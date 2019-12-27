<#
.SYNOPSIS

.DESCRIPTION
    Long description
.EXAMPLE
    @(1002,4,3,4,33)

    ABCDE
    DE - two-digit opcode,      02 == opcode 2
    C - mode of 1st parameter,  0 == position mode
    B - mode of 2nd parameter,  1 == immediate mode
    A - mode of 3rd parameter,  0 == position mode,
                                  omitted due to being a leading zero
    
    This instruction multiplies its first two parameters. The first parameter, 4 
    in position mode, works like it did before - its value is the value stored at 
    address 4 (33). The second parameter, 3 in immediate mode, simply has value 3. 
    The result of this operation, 33 * 3 = 99, is written according to the third 
    parameter, 4 in position mode, which also works like it did before - 99 is 
    written to address 4.

    Parameters that an instruction writes to will never be in immediate mode.
   
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    1 = The ID of the ships computer

.PARAMETER MODES
    0 = Position mode -- interprets parameter as memory address(or element)
    1 = Immediate mode -- interprets parameter as a value

.OPCODES
    01 = Add numbers read from two positions and stores the result in a third position
    02 = Multiply numbers read from two positions and stores the result in a third position
    03 = Takes single integer as input and saves it in the position given by its only parameter
    04 = Outputs the value of its only parameter
    99 = Program is finished and should immediately halt

#>


function Get-SystemID {
    <#
    .SYNOPSIS
    Get-SystemID will acquire the system ID which is required as the initial input for diagnostic computer
    #>
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(mandatory=$true)]
        [string]
        $SystemID
    )
    
    begin {

    }
    
    process {
        switch ($SystemID) {
            1 {
                $SystemName = "Ship AC Unit"
                break
              }
            Default { 
                $StatusMessage = Write-Warning "UNDEFINED SYSTEM ID"
                $NotFound = $true
                break
              }
        }
        $SystemInfo = [PSCustomObject]@{
            SystemID = [int]$SystemID
            SystemName = $SystemName
        }
    }
    end {
        if ($NotFound -eq $true){
            $StatusMessage
        }else{
            $SystemInfo
        }
    }
}


$MyShip = Get-SystemID -SystemID 1

$MyShip.SystemID




function Invoke-Opcode {
    <#
    .SYNOPSIS
    Invoke-Opcode should accept input from other functions and process the parameter values according to the 
    Opcode and parameter mode inputs and possibly from the actual parameters. Might need to rename the function 
    to make more sense.
    #>
    [CmdletBinding()]
    param (
        # Accepts an opcode 
        [Parameter(mandatory=$true)]
        [string]
        $Opcode
    )
    
    begin {
        
    }
    
    process {
       switch ($Opcode) {
           01 { # Instruction length will equal 4 since the instruction for this Opcode(1) will contain the Opcode and two values(2,3) it will add 
                # together and store the result in a third position(4).

             }
           02 { # Instruction length will equal 4 since the instruction for this Opcode(1) will contain the Opcode and two values(2,3) it will multiply 
                # together and store the result in a third position(4). 

            }
           03 { # Instruction Length will equal 2 since the instruction for this Opcode will only contain the Opcode and a single Parameter 
                # Only has 1 parameter. Takes a single integer as input and stores it at the position of its parameter. Example: 3,50 would 
                # take an input value and store it at address 50  
                $OpcodeInput $Parameter = $Instruction
                $PointerMovement = $Instruction.Length 
               
            } 
           04 { # Instruction Length will equal 2 since the instruction for this Opcode will only contain the Opcode and a single Parameter 
                # Only has 1 parameter. Outputs the value of its only parameter. Example: 4,50 would output the value stored at address 50
            
             }
           99 { # The Opcode means the program halts - - PointerMovement value of 0
               
             }
           Default {}
       } 
    }
    
    end {
        
    }
}









function Get-Instruction {
    <#
    .SYNOPSIS
    Get-Instructions should an input from somewhere(the puzzle input but maybe after other processing) and output the instruction 
    which will contain the opcode and parameter modes for further processing in other functions
    #>
    [CmdletBinding()]
    param (
        # The instruction includes the opcode and parameter modes
        [Parameter(mandatory=$true)]
        [int]
        $Instruction #Need to come up with a more appropriate input
    )
    
    begin {
        
    }
    
    process {
        
    }
    
    end {
        
    }
}

function Get-Opcode {
    <#
    .SYNOPSIS
    Get-Opcode should take the instruction(taken from another function) and determine the 
    Opcode and provide it as output
    #>
    [CmdletBinding()]
    param (
        # Should take the ouput of the Get-Instruction function as a string array
        [Parameter(mandatory=$true)]
        [string[]]
        $Instruction
    )
    
    begin {
        
    }
    
    process {
        
    }
    
    end {
        
    }
}



function Get-ParameterMode {
    <#
    .SYNOPSIS
    Get-ParameterMode should take the instruction(taken from another function) and determine the 
    parameter mode(s) and provide them as output
    #>
    [CmdletBinding()]
    param (
        # Should take the output of the Get-Instruction function as a string array
        [Parameter(Mandatory=$true)]
        [string[]]
        $Instruction        
    )
    
    begin {
        
    }
    
    process {
        
    }
    
    end {
        
    }
}

function Move-InstructionPointer {
    <#
    .SYNOPSIS
    Move-InstructionPointer moves the instruction pointer according the number of values in an instruction.
    This will probably take input from Get-Instruction but I need to reread the rules to make sure I understand.
    #>
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(AttributeValues)]
        [ParameterType]
        $ParameterName
    )
    
    begin {
        
    }
    
    process {
        
    }
    
    end {
        
    }
}

function Get-DiagnosticTestData {
    <#
    .SYNOPSIS
    Get-DiagnosticTestData should capture the output of the tests to provide diagnostic and troubleshooting 
    info. This might not be needed.
    #>
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        
    }
    
    process {
        
    }
    
    end {
        
    }
}

