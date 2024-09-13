#requires -RunAsAdministrator
# Set-ExecutionPolicy AllSigned
# <https://learn.microsoft.com/en-us/powershell/module/hyper-v/set-vmfirmware?view=windowsserver2022-ps>
$VMName = 'AlpinePrimus'
$BootDevice = 'C:\Virtual Hard Disks\AlpinePrimus.vhdx'
#
Set-VMFirmware -VMName $VMName -FirstBootDevice $BootDevice
#
Get-VMDvdDrive -VMName $VMName | Set-VMDvdDrive -Path $null
