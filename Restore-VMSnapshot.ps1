<#
    Original Author: Chloe Carpenter

    Role of script: Restore from Virtual Machine Snapshot
#>

$VMName = Read-Host -Prompt "VM Name"

Restore-VMSnapshot -VMName $VMName -Name (Read-Host -Prompt "Snapshot Name")