###########################################################################################
# Original Author: Chloe Carpenter
#
# Role of script: Remove ISO file
###########################################################################################

###########
# VM Name
###########
$VMName = Read-Host -Prompt "VM Name"

###################################
# Controller: Location and Number
###################################
$ContNum = Read-Host -Prompt "Controller Number"

$ContLoc = Read-Host -Prompt "Controller Location"

Remove-VMDvdDrive -VMName $VMName -ControllerNumber $ContNum -ControllerLocation $ContLoc