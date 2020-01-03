Function Get-DscLogFile {
    param (
        $ComputerName,
        $JobId,
        [Switch]$vsCode
    )
    $jobId = "{$jobId}"
    $path = ('\\{0}\c$\Windows\System32\Configuration\ConfigurationStatus\{1}-0.details.json' -f $ComputerName, $JobId)
    if ($vsCode) {
        code.cmd $path
    }
    else {
        Get-Content $path
    }
}