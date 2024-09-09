<#

.SYNOPSIS
Azure Virtual Desktop Image Builder Function Script.

.DESCRIPTION
This Script is used to apply a wait interval. 
Applys a 120 second wait before the next script begins.

#>

#######################################
#    Sleep 120 Seconds                #
#######################################
# Azure Virtual Desktop Image Builder Software Script
# This Script is used to apply a customizable wait interval

####################################
#  Variables                       #
#################################### 
$SleepTimeSeconds = 120
$AppName = "Sleep $SleepTimeSeconds Seconds"
$timeInt = (Get-Date -Format FileDateTimeUniversal)

####################################
#  Functions                       #
####################################
# Log Writer
if (!(Test-Path function:Write-Log)) {
    function Write-Log($message) {
        Write-Host *** $timeInt AVD AIB Customization - $AppName - $message *** -ForegroundColor Yellow
    }
}
if (!(Test-Path function:Write-Error)) {
    function Write-Error($message) {
        Write-Host *** $timeInt AVD AIB Customization - $AppName - $message *** -ForegroundColor Red
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