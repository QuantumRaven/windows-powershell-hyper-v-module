###########################################################################################
# Original Author: Chloe Carpenter
#
# Role of script: Disconnect VHDX file and get confirmation before deleting it
###########################################################################################

###########
# VM Name
###########

Write-Output "Virtual Machine Name `n"

$VMName = Read-Host -Prompt "VMName"

#############
# VHDX Name
#############

Write-Output "VHDX Name `n"

$VHDXName = Read-Host -Prompt "VHDXName"

###################
# Disconnect VHDX
###################

$ContNum = Read-Host -Prompt "Controller Number"

$ContLoc = Read-Host -Prompt "Controller Location"

Remove-VMHardDiskDrive -VMName $VMName -ControllerNumber $ContNum -ControllerLocation $ContLoc -ControllerType SCSI

###############
# Delete VHDX
###############

Remove-Item -Path F:\$VMName\$VHDXName.vhdx -Confirm