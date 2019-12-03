
function Invoke-Intcode {
    [CmdletBinding()]
    param (
        [parameter(Mandatory)]
        [int[]]
        $OpCodes
    )
    
    begin {
        $Memory = @{}
        $ReadinPosition = 0
    }
    
    process {
        foreach ($op in $OpCodes){
            $Memory[$ReadinPosition] = [int]$op
            $ReadinPosition++
        }        
    }
    
    end {
        $Position = 0
        do {
            if ($VerbosePreference){
                Write-Verbose "Memory: $(($Memory.getEnumerator()|sort name|% value)-join',')"
            }
            switch ($Memory[$Position]){
                1 {
                    Write-Verbose "OP: 1, Add"
                    $Memory[$Memory[$Position+3]] = $Memory[$Memory[$Position+1]] + $Memory[$Memory[$Position+2]]
                    $Position = $Position + 4
                }
                2 {
                    Write-Verbose "OP: 2, Mul"
                    $Memory[$Memory[$Position+3]] = $Memory[$Memory[$Position+1]] * $Memory[$Memory[$Position+2]]
                    $Position = $Position + 4
                }
                99 { # nop
                    Write-Verbose "OP: 99, End"
                }
                Default {
                    Write-Error "Invalid op code $_ at $Position."
                    return
                }
            }
        } until ( $Memory[$Position] -eq 99 )
        if ($VerbosePreference){
            Write-Verbose "Memory: $(($Memory.getEnumerator()|sort name|% value)-join',')"
        }
        return [PSCustomObject]@{ Memory = $Memory; FinalPosition = $Position }
    }
}

function Get-GravityAssistResult {
    [CmdletBinding()]
    param (
        [parameter(Mandatory)]
        [int]$Noun,
        [Parameter(Mandatory)]
        [int]$Verb
    )
    
    end {
        $Program = (gc "$PSScriptRoot\input.txt") -split ','
        $Program[1]=$Noun
        $Program[2]=$Verb
        $r = Invoke-Intcode -OpCodes $Program
        $r.Memory[0]
    }
}

function Find-FinalValue {
    [CmdletBinding()]
    param (
        [parameter(Mandatory)]
        [int]
        $Target
    )
    end {
        1..99 | %{
            $a = $_
            1..99 | %{
                $b = $_
                $Out = Get-GravityAssistResult -Noun $a -Verb $b
                if ($Out -eq $Target){
                    return [pscustomObject]@{Noun=$a;Verb=$b}
                }
            }
        }
    }
}

Get-GravityAssistResult -Noun 12 -Verb 02
Find-FinalValue -Target 19690720