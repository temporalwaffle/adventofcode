# Part 1
$ModulesMass = Get-Content .\input.txt

$TotalMass = 0


# foreach ($Mass in $ModulesMass) {
#     $ModuleFuelRequirement = ([Math]::Truncate($Mass / 3) - 2)
#     $TotalMass = $ModuleFuelRequirement + $TotalMass
#     Write-Output $TotalMass
# }

# Part 1 answer = 3256114

# Part 2

function Get-FuelRequirement ($Mass) {
    $FuelRequirement = ([Math]::Truncate($Mass / 3) - 2)
    if ($FuelRequirement -lt 0) {
        Write-Output 0
    }
    else{
        Write-Output $FuelRequirement
    }
}

function Get-FuelForFuel ($CurrentFuel){
    $Fuel = Get-FuelRequirement $CurrentFuel
    if ($Fuel -eq 0){
        $Fuel
    }
    else{
        $FuelForFuel = Get-FuelForFuel $Fuel
        $Fuel + $FuelForFuel
    }
}

function Get-TotalFuelForModule ($Mass){
    $ModuleFuel = Get-FuelRequirement($Mass)
    $ModuleFuel2 = Get-FuelForFuel $ModuleFuel
    $ModuleFuel + $ModuleFuel2
}

foreach ($Mass in $ModulesMass) {
    $FuelRequirement = Get-TotalFuelForModule $Mass
    $TotalMass = $FuelRequirement + $TotalMass
    Write-Output $TotalMass
}

# Part 2 answer = 4881302