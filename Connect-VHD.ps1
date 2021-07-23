###########################################################################################
# Original Author: Chloe Carpenter
#
# Role of script: Create a VHDX drive and connect it to a virtual machine.
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

#############
# VHDX Size
#############
Write-Output "VHDX Info `n"

$Size = 1GB

$SizeNumber = Read-Host -Prompt "How many GB"

$VDiskSize = $Size*$SizeNumber

###################################
# Controller: Location and Number
###################################
$ContNum = Read-Host -Prompt "Controller Number"

$ContLoc = Read-Host -Prompt "Controller Location"

###############
# Create VHDX
###############
New-VHD -Path F:\$VMName\$VHDXName.vhdx -SizeBytes $VDiskSize -Dynamic

######################
# Connect VHDX to VM
######################
Add-VMHardDiskDrive -VMName $VMName -ControllerNumber $ContNum -ControllerLocation $ContLoc -Path F:\$VMName\$VHDXName.vhdx