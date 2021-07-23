<#
    Original Author: Chloe Carpenter

    Role of script: Checkpoint Hyper-V Virtual Machines
#>

Remove-VMSnapshot -VMName (Read-Host -Prompt "Choose VM to remove checkpoint") -Name (Read-Host -Prompt "Checkpoint Name")