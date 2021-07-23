###########################################################################################
# Original Author: Chloe Carpenter
#
# Role of script: Checkpoint Hyper-V Virtual Machines
###########################################################################################

$VMName = Read-Host -Prompt "Choose VM to create checkpoint"
$SnapName = Read-Host -Prompt "Custom checkpoint name"

Checkpoint-VM -VMName $VMName -SnapshotName $SnapName