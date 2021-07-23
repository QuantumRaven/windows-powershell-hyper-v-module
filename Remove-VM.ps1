<#
    Original Author: Chloe Carpenter

    Role of script: Removes the specified virtual machine and deletes all data and the associated VHDX file tied to it
#>


$VMName = Read-Host -Prompt "VMName"

$VHDXFile = "F:\$VMName\$VMName.vhdx"

$VHDXFolder = "F:\$VMName"

$VMData = "L:\$VMName"

Remove-VM -VMName $VMName -Force

Remove-Item -Path $VHDXFile -Recurse

Remove-Item -Path $VHDXFolder -Recurse

Remove-Item -Path $VMData -Recurse