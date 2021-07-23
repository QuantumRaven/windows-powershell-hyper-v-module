#################################################################################################
# Original Author: Chloe Carpenter
#
# Role of script: This script is used to create new Generation 2 Linux VMs in Microsoft Hyper-V
#################################################################################################

##################
# Name of the VM
##################

$VMName = Read-Host -Prompt "VMName"

###################
# VM Generation 2
###################

$Gen2 = 2

####################
# Processor Number
####################

Write-Output "Virtual Processors `n"

$ProcCount = Read-Host -Prompt "Number of vCPUs"

##################
# Dynamic Memory
##################

##################
# Startup Memory
##################

$StartMem = 1GB

##################
# Minimum Memory
##################

$MinMem = 512MB

##################
# Maximum Memory
##################

Write-Output "Maximum Memory `n"

$MaxMem = 1GB

$MaxMemNumber = Read-Host -Prompt "Memory GB"

$MaxMemSize = $MaxMem*$MaxMemNumber

####################
# Path for VM Data
####################

$VMPath = "L:\$VMName\"

#############
# VHDX Path 
#############

$VHDXPath = "F:\$VMname\$VMName.vhdx"

###############
# VHDX Size(s)
###############

Write-Output "Storage Size `n"

$VDSizeBytes = 1GB

$VDSizeNumber = Read-Host -Prompt "Storage GB"

$VDiskSize = $VDSizeBytes*$VDSizeNumber

####################################
# Add External VM-Switch named Ext
####################################

$VMSwitch = "Ext"

######################
# VM Checkpoint Type
######################

$CheckpointType = "Standard"

########################
# Secure Boot Template
########################

$SBTemplate = "MicrosoftUEFICertificateAuthority"

#############
# Create VM
#############

New-VM -Name $VMName -MemoryStartupBytes $StartMem `
-SwitchName $VMSwitch -Path $VMPath -NewVHDPath $VHDXPath `
-NewVHDSizeBytes $VDiskSize `
-Generation $Gen2

##########################
# Setup VM post creation
##########################

Set-VM -VMName $VMName -ProcessorCount $ProcCount -DynamicMemory `
-MemoryMinimumBytes $MinMem -MemoryMaximumBytes $MaxMemSize `
-CheckpointType $CheckpointType -AutomaticCheckpointsEnabled $False

Write-Host "Select from ISO from D drive `
D:\ISO\ArchLinux.iso `
D:\ISO\CentOS8.2-min.iso `
D:\ISO\Debian10.iso `
D:\ISO\UbuntuServer20.iso `
`n"

Add-VMDvdDrive -VMName $VMName -Path (Read-Host -Prompt "Select ISO File")

#####################
# Setup Secure Boot
#####################

Set-VMFirmware -VMName $VMName -SecureBootTemplate $SBTemplate

#####################
# Config Boot Order
#####################

$VMDVD = Get-VMDvdDrive -VMName $VMName
$VMVHD = Get-VMHardDiskDrive -VMName $VMname
$VMNet = Get-VMNetworkAdapter -VMName $VMName

#####################
# Setup Boot Order
#####################

Set-VMFirmware -VMName $VMName -BootOrder $VMDVD, $VMVHD, $VMNet

##################################
# Enable Guest Service Interface
##################################

Enable-VMIntegrationService -VMName $VMName -Name "Guest Service Interface"