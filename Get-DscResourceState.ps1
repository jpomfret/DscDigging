function Get-DscResourceState {
    param (
        $ComputerName,
        $State 
    )
    $test = Test-DscConfiguration -ComputerName $ComputerName -Detailed
    $results = @()
    switch ($State) {
        "Desired" {
            $results += $test.ResourcesInDesiredState | Select-Object ResourceId, ResourceName, instancename, startdate, indesiredstate
        }
        "NotDesired" { 
            $results += $test.ResourcesNotInDesiredState |Select-Object ResourceId, ResourceName, instancename, startdate, indesiredstate
        }
        default { 
            $results += $test.ResourcesInDesiredState | Select-Object ResourceId, ResourceName, instancename, startdate, indesiredstate
            $results += $test.ResourcesNotInDesiredState |Select-Object ResourceId, ResourceName, instancename, startdate, indesiredstate
        }
    }
    return $results
}