<#

.SYNOPSIS
Azure Virtual Desktop Image Builder Function Script. This Script is used to apply a wait interval.

.DESCRIPTION
Applys a 60 second wait before the next script begins.


#>


#################################### 
#  Variables                       #
#################################### 
$SleepTimeSeconds = 60
$AppName = "Sleep $SleepTimeSeconds Seconds"
$timeInt = (Get-Date -Format FileDateTimeUniversal)

#################################### 
#  Functions                       #
#################################### 
# Log Writer
if (!(Test-Path function:Write-Log)) {
    function Write-Log($message) {
        Write-Host *** $timeInt AVD AIB Function - $AppName - $message ***
    }
}
if (!(Test-Path function:Write-Error)) {
    function Write-Error($message) {
        Write-Host *** $timeInt AVD AIB Function - $AppName - $message ***
    }
}

####################################
#  Start                           #
####################################  
try {
    Write-Log("Sleeping for $SleepTimeSeconds Seconds at $timeInt ")
    Start-Sleep -Seconds $SleepTimeSeconds
    Write-Log("Sleep Completed at $timeInt ")
}
catch {
    Write-Error("Script Error")
    throw $_.Exception
}

#################################### 
#   END                            #
#################################### 