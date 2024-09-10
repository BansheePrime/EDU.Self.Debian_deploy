#requires -RunAsAdministrator

$VMName = 'DebianDemerara'
$InstallationMedia = 'D:\iso\debian-12.7.0-amd64-netinst.iso'
New-VM -Name $VMName -MemoryStartupBytes 4GB -NewVHDPath "C:\Virtual Hard Disks\DebianDemerara.vhdx" -NewVHDSizeBytes 12GB -Path "C:\Virtual Hard Disks\$VMName" -Generation 2 -Switch External
# Add DVD Drive to Virtual Machine
Add-VMScsiController -VMName $VMName
Add-VMDvdDrive -VMName $VMName -ControllerNumber 1 -ControllerLocation 0 -Path $InstallationMedia
# Mount Installation Media
$DVDDrive = Get-VMDvdDrive -VMName $VMName
# Configure Virtual Machine to Boot from DVD
Set-VMFirmware -VMName $VMName -FirstBootDevice $DVDDrive -EnableSecureBoot Off
Set-VMMemory -VMName $VMName -DynamicMemoryEnabled $false
Set-VM -VMName $VMName -ProcessorCount 2 -CheckpointType Disabled -AutomaticStopAction Shutdown -AutomaticStartAction Nothing -AutomaticStopAction TurnOff -Passthru
Disable-VMIntegrationService -VMName $VMName -Name "Интерфейс гостевой службы"
Disable-VMIntegrationService -VMName $VMName -Name "Пульс"
Disable-VMIntegrationService -VMName $VMName -Name "Обмен парами `"ключ-значение`""