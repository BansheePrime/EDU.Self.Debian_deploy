#requires -RunAsAdministrator
# Set-ExecutionPolicy AllSigned
# provision_alpine_vm2.ps1 -ExecutionPolicy Bypass
$VMName = 'AlpineSecundus'
$InstallationMedia = 'D:\iso\alpine-virt-3.20.3-x86_64.iso'
New-VM -Name $VMName -MemoryStartupBytes 1GB -NewVHDPath "C:\Virtual Hard Disks\AlpineSecundus.vhdx" -NewVHDSizeBytes 2GB -Path "C:\Virtual Hard Disks\$VMName" -Generation 2 -Switch External
Add-VMScsiController -VMName $VMName
Add-VMDvdDrive -VMName $VMName -ControllerNumber 1 -ControllerLocation 0 -Path $InstallationMedia
$DVDDrive = Get-VMDvdDrive -VMName $VMName
Set-VMFirmware -VMName $VMName -FirstBootDevice $DVDDrive
Set-VMFirmware -VMName $VMName -EnableSecureBoot Off
Set-VMMemory -VMName $VMName -DynamicMemoryEnabled $false
Set-VM -VMName $VMName -ProcessorCount 1 -CheckpointType Disabled -AutomaticStartAction Nothing -AutomaticStopAction TurnOff -Passthru
Disable-VMIntegrationService -VMName $VMName -Name "Интерфейс гостевой службы"
Disable-VMIntegrationService -VMName $VMName -Name "Пульс"
Disable-VMIntegrationService -VMName $VMName -Name "Обмен парами `"ключ-значение`""
Disable-VMIntegrationService -VMName $VMName -Name "VSS"
