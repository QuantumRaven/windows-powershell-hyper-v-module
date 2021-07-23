# Checkpoint-VM.ps1
## Role of script:
- Prompts user to pick a virtual machine for checkpoint creation.
- Prompts user to assign a custom name for the checkpoint.
- Creates a checkpoint based on the answers to the arguments.

### Checkpoint-VM: What it is and how it works:
> The Checkpoint-VM cmdlet creates a checkpoint of a virtual machine.
>
> Note: In Windows Server 2012 R2, virtual machine snapshots were renamed to virtual machine checkpoints. For clarity, this document will refer to virtual machine snapshots as checkpoints. - [Checkpoint-VM - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/checkpoint-vm?view=win10-ps)

Example:

 `Checkpoint-VM -VMName deblab -SnapshotName base_2020-09-30` would create a checkpoint for the virtual machine deblab and name it base_2020-09-30. So, if something were to go wrong during the use of said VM, you could turn the VM off and store from any checkpoint tied to it and go from there.

# Connect-VHD.ps1
## Role of script:
- Utilizes custom variables along with the `New-VHD` and `Add-VMHardDiskDrive` cmdlets to create and attach VHDs or Virtual Hard Drives.

### New-VHD: What it is and how it works:
> The New-VHD cmdlet creates one or more new virtual hard disks in either VHD format or the newer VHDX format. The file name extension you specify determines the format. - [New-VHD - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/new-vhd?view=win10-ps)

Example:

`New-VHD -Path D:\VM_Storage\disk0.vhdx -SizeBytes 10GB`
- Creates a virtual hard drisk in the VHDX format. The file name extension you specify determines the format.

### Add-VMHardDiskDrive: What it is and how it works:
> The Add-VMHardDiskDrive cmdlet adds a hard disk drive to a virtual machine. - [Add-VMHardDiskDrive - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/add-vmharddiskdrive?view=win10-ps)

Example:

`Add-VMHardDiskDrive -VMName Test -Path D:\VM_Storage\disk0.vhdx`
- Creates a virtual hard disk using file D:\VM_Storage\disk0.vhdx on virtual machine Test.

# Disconnect-VHD.ps1
## Role of script:
- Disconnects a VHD file from a specified virtual machine.

### Remove-VMHardDiskDrive: What it is and how it works:
> The Remove-VMHardDiskDrive cmdlet deletes a hard disk drive from a virtual machine. - [Remove-VMHardDiskDrive - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/remove-vmharddiskdrive?view=win10-ps)

### Remove-Item: What it is and how it works:
> The Remove-Item cmdlet deletes one or more items. Because it is supported by many providers, it can delete many different types of items, including files, folders, registry keys, variables, aliases, and functions. - [Remove-Item - Microsoft.PowerShell.Management - PowerShell](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-7)

# New-LinuxVM.ps1
## Role of script:
- Creates and sets up virtual hardware for Linux based virtual machines

### New-VM: What it is and what it does
> The New-VM cmdlet creates a new virtual machine. [New-VM - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/new-vm?view=win10-ps)

### Set-VM: What it is and what it does:

> The Set-VM cmdlet configures a virtual machine. [Set-VM - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/set-vm?view=win10-ps)

### Write-Host: What it is and what it does:
> The `Write-Host` cmdlet's primary purpose is to produce for-(host)-display-only output, such as printing colored text like when prompting the user for input in conjunction with [Read-Host](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/read-host?view=powershell-7). `Write-Host` uses the [ToString()](https://docs.microsoft.com/en-us/dotnet/api/system.object.tostring) method to write the output. By contrast, to output data to the pipeline, use [Write-Output](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/write-output?view=powershell-7) or implicit output.
>
> You can specify the color of text by using the `ForegroundColor` parameter, and you can specify the background color by using the `BackgroundColor` parameter. The Separator parameter lets you specify a string to use to separate displayed objects. The particular result depends on the program that is hosting PowerShell.

### Add-VMDvdDrive: What it is and what it does:
> The Add-VMDvdDrive cmdlet adds a DVD drive to a virtual machine. - [Add-VMDvdDrive - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/add-vmdvddrive?view=win10-ps)

### Set-VMFirmware: What it is and what it does:
> The Set-VMFirmware cmdlet sets the firmware configuration of a Generation 2 virtual machine. [Set-VMFirmware - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Set-VMFirmware?view=win10-ps)

### Get-VMDvdDrive: What it is and what it does:
> The Get-VMDvdDrive cmdlet gets the DVD drives attached to a virtual machine or snapshot. This cmdlet has no ControllerType parameter, as the Get-VMHardDiskDrive cmdlet does, because virtual DVD drives can be attached only to the IDE controller. [Get-VMDvdDrive - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Get-VMDvdDrive?view=win10-ps)

### Get-VMHardDiskDrive: What it is and what it does:
> The Get-VMHardDiskDrive cmdlet gets the virtual hard disk drives attached to one or more virtual machines. [Get-VMHardDiskDrive - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Get-VMHardDiskDrive?view=win10-ps)

### Get-VMNetworkAdapter: What it is and what it does:
> The Get-VMNetworkAdapter cmdlet gets the virtual network adapters of the specified virtual machine, snapshot, or management operating system. [Get-VMNetworkAdapter - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Get-VMNetworkAdapter?view=win10-ps)

### Enable-VMIntegrationService: What it is and what it does:
> The Enable-VMIntegrationService cmdlet enables an integration service on a virtual machine. [Enable-VMIntegrationService - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Enable-VMIntegrationService?view=win10-ps)

# New-WindowsVM.ps1
## Role of script:
- Creates and sets up virtual hardware for Windows based virtual machines

### New-VM: What it is and what it does
> The New-VM cmdlet creates a new virtual machine. [New-VM - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/new-vm?view=win10-ps)

### Set-VM: What it is and what it does:

> The Set-VM cmdlet configures a virtual machine. [Set-VM - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/set-vm?view=win10-ps)

### Write-Host: What it is and what it does:
> The `Write-Host` cmdlet's primary purpose is to produce for-(host)-display-only output, such as printing colored text like when prompting the user for input in conjunction with [Read-Host](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/read-host?view=powershell-7). `Write-Host` uses the [ToString()](https://docs.microsoft.com/en-us/dotnet/api/system.object.tostring) method to write the output. By contrast, to output data to the pipeline, use [Write-Output](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/write-output?view=powershell-7) or implicit output.
>
> You can specify the color of text by using the `ForegroundColor` parameter, and you can specify the background color by using the `BackgroundColor` parameter. The Separator parameter lets you specify a string to use to separate displayed objects. The particular result depends on the program that is hosting PowerShell.

### Add-VMDvdDrive: What it is and what it does:
> The Add-VMDvdDrive cmdlet adds a DVD drive to a virtual machine. - [Add-VMDvdDrive - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/add-vmdvddrive?view=win10-ps)

### Set-VMFirmware: What it is and what it does:
> The Set-VMFirmware cmdlet sets the firmware configuration of a Generation 2 virtual machine. [Set-VMFirmware - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Set-VMFirmware?view=win10-ps)

### Get-VMDvdDrive: What it is and what it does:
> The Get-VMDvdDrive cmdlet gets the DVD drives attached to a virtual machine or snapshot. This cmdlet has no ControllerType parameter, as the Get-VMHardDiskDrive cmdlet does, because virtual DVD drives can be attached only to the IDE controller. [Get-VMDvdDrive - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Get-VMDvdDrive?view=win10-ps)

### Get-VMHardDiskDrive: What it is and what it does:
> The Get-VMHardDiskDrive cmdlet gets the virtual hard disk drives attached to one or more virtual machines. [Get-VMHardDiskDrive - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Get-VMHardDiskDrive?view=win10-ps)

### Get-VMNetworkAdapter: What it is and what it does:
> The Get-VMNetworkAdapter cmdlet gets the virtual network adapters of the specified virtual machine, snapshot, or management operating system. [Get-VMNetworkAdapter - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Get-VMNetworkAdapter?view=win10-ps)

### Enable-VMIntegrationService: What it is and what it does:
> The Enable-VMIntegrationService cmdlet enables an integration service on a virtual machine. [Enable-VMIntegrationService - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Enable-VMIntegrationService?view=win10-ps)

# Remove-VM.ps1
## Role of script:
- Removes the specified virtual machine and deletes all data and the associated VHDX file tied to it

### Remove-VM: What it is and what it does:
> The `Remove-VM` cmdlet deletes a virtual machine. Running this cmdlet deletes the virtual machine's configuration file, but does not delete any virtual hard drives. If the virtual machine has any snapshots, these are deleted and merged into the virtual hard disk files after the virtual machine is deleted. [Remove-VM - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Remove-VM?view=win10-ps)

### Remove-Item: What it is and how it works:
> The Remove-Item cmdlet deletes one or more items. Because it is supported by many providers, it can delete many different types of items, including files, folders, registry keys, variables, aliases, and functions. - [Remove-Item - Microsoft.PowerShell.Management - PowerShell](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/remove-item?view=powershell-7)

# Remove-VMDvdDrive.ps1
## Role of script: 
- Remove ISO file from VM

### Remove-VMDvdDrive: What it is and how it works:
> The `Remove-VMDvdDrive` cmdlet deletes a DVD drive from a virtual machine. [Remove-VMDvdDrive - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/Remove-VMDvdDrive?view=win10-ps)

### Read-Host: What it is and how it works:
> The `Read-Host` cmdlet reads a line of input from the console. You can use it to prompt a user for input. Because you can save the input as a secure string, you can use this cmdlet to prompt users for secure data, such as passwords, as well as shared data. [Read-Host - Microsoft.PowerShell.Utility - PowerShell](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/Read-Host?view=powershell-7)

# Remove-VM.ps1
## Role of script:
- Deletes virtual machine
- Deletes all VHD files
- Deletes all VM data files

### Remove-VM: What it is and how it works:
> The `Remove-VM` cmdlet deletes a virtual machine. Running this cmdlet deletes the virtual machine's configuration file, but does not delete any virtual hard drives. If the virtual machine has any snapshots, these are deleted and merged into the virtual hard disk files after the virtual machine is deleted. [Remove-VM - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/remove-vm?view=win10-ps)

# Restore-VMSnapshot.ps1
## Role of script:
- Restores the VM from a specified checkpoint

### Restore-VM: What it is and how it works:
> The Restore-VMSnapshot cmdlet restores a virtual machine checkpoint.
>
> Note: In Windows Server 2012 R2, virtual machine snapshots were renamed to virtual machine checkpoints. For clarity, this document will refer to virtual machine snapshots as checkpoints. [Restore-VM - Hyper-V - PowerShell](https://docs.microsoft.com/en-us/powershell/module/hyper-v/restore-vmsnapshot?view=win10-ps)