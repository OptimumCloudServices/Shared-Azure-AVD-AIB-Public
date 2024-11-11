# Azure Virtual Desktop Image Builder Customization Script
# This Script is used to disable BitLocker for the C Drive
    
####################################
#  Functions                       #
####################################
# Log Writer
if (!(Test-Path function:Write-Log)) {
    function Write-Log($message) {
        Write-Host *** $timeInt AVD AIB Customization - Image Preparation - $message *** -ForegroundColor Yellow
    }
}
if (!(Test-Path function:Write-Error)) {
    function Write-Error($message) {
        Write-Host *** $timeInt AVD AIB Customization - Image Preparation - $message *** -ForegroundColor Red
    }
}

####################################
#  Preparation                     #
####################################

# Set PowerShell Execution Policy
Set-ExecutionPolicy Bypass -Force


####################################
#  Start                           #
####################################  
try {

    # Begin
    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    Write-Log("Start")

    # Check BitLocker Status
    Write-Log("Checking BitLocker Status")
    $BLinfo = Get-Bitlockervolume

    if($blinfo.ProtectionStatus -eq 'On'){
        Write-Log("'$env:computername - '$($blinfo.MountPoint)' is encrypted")
        Write-Log("Disabling BitLocker for C Drive")
        Disable-BitLocker -MountPoint "C:"
    }
}

catch {
    Write-Error("Image Prep Failure")
    throw "Exit code: $($RV.ExitCode); Error: $($_.Exception.Message)"
}

# Return final exit code
$stopwatch.Stop()
$elapsedTime = $stopwatch.Elapsed
Write-Log("Exit Code: $($RV.ExitCode) ***")
Write-Log("End - Time taken: $elapsedTime ***")

#############
#    END    #
############# 

<#

TODO : Add Loop to check for encrpytion percentage, verify  Encryption Percentage = 0

#>