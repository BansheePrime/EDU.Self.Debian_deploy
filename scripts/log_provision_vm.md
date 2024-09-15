# Provision Debian on Hyper-V

Fascinating reading:
<https://automatedlab.org/en/latest/Wiki/Basic/gettingstarted/>
Quoting:
*"AutomatedLab is a provisioning solution and framework that lets you deploy complex labs on HyperV and Azure with simple PowerShell scripts. "*
<https://github.com/AutomatedLab/AutomatedLab?tab=readme-ov-file>



## Table of Contents

1. [The Script](#the-script)
2. [TODO](#todo)
3. [Notes](#notes)

<a id="the-script"></a>
## The Script

```powershell
# Set VM Name, Switch Name, and Installation Media Path.
$VMName = 'DebianDemerara'
$InstallationMedia = 'D:\iso\debian-12.7.0-amd64-netinst.iso'
# Create New Virtual Machine
New-VM -Name $VMName -MemoryStartupBytes 4GB -NewVHDPath "C:\Virtual Hard Disks\DebianDemerara.vhdx" -NewVHDSizeBytes 12GB -Path "C:\Virtual Hard Disks\$VMName" -Generation 2 -Switch External
# Add DVD Drive to Virtual Machine
Add-VMScsiController -VMName $VMName
Add-VMDvdDrive -VMName $VMName -ControllerNumber 1 -ControllerLocation 0 -Path $InstallationMedia
# Mount Installation Media
$DVDDrive = Get-VMDvdDrive -VMName $VMName
# Configure Virtual Machine to Boot from DVD
Set-VMFirmware -VMName $VMName -FirstBootDevice $DVDDrive
Set-VMMemory -VMName $VMName -DynamicMemoryEnabled $false
Set-VMFirmware -VMName $VMName -EnableSecureBoot Off
Set-VM -VMName $VMName -ProcessorCount 2 -CheckpointType Disabled -AutomaticStopAction Shutdown -Passthru
Set-VM -VMName $VMName -AutomaticStartAction Nothing -AutomaticStopAction TurnOff
Disable-VMIntegrationService -VMName $VMName -Name "Интерфейс гостевой службы"
Disable-VMIntegrationService -VMName $VMName -Name "Пульс"
Disable-VMIntegrationService -VMName $VMName -Name "Обмен парами `"ключ-значение`""
```

## TODO

<a id="todo"></a>

[]
[]
[]

## Notes

<a id="notes"></a>

### Detailed Information About Hyper-V VMs

Get-VM -Name "AlpinePrimus" | Select-Object *
Get-VM -Name "AlpinePrimus" | Select-Object -ExpandProperty HardDrives | Select-Object *
Get-VMHardDiskDrive -VMName "AlpinePrimus" | Select-Object *

### Название VMIntegrationService по-русски

- Интерфейс гостевой службы
- Пульс
- Обмен парами "ключ-значение"
- Завершение работы
- Синхронизация времени
- VSS

**Оставить** в работе "Синхронизация времени" и "Завершение работы".

### Список VMIntegrationService

Получить список:

```powershell
Get-VMIntegrationService -VMName $VMName
```

Пример отключения **VMIntegrationService** на машине с Eng системой:

```powershell
Disable-VMIntegrationService -VMName $VMName -Name "Guest Service Interface"
Disable-VMIntegrationService -VMName $VMName -Pick Name "Heartbeat"
Disable-VMIntegrationService -VMName $VMName -Name "Key-Value Pair Exchange"
Disable-VMIntegrationService -VMName $VMName -Name "VSS"
```

### Проверить версию Powershell

Всегда забываю ;-)

```powershell
$PSVersionTable
```

### Confirm the file doesn’t already exist. Throw a terminating error if it does

```powershell
if(Test-Path -Path $SourceFile){
    throw "The file '$SourceFile' already exists"
}
```

## Launch selected VMs

**NB** I wish there was tool like vagrant on Win

```powershell
Get-Vm | Where-Object { $_.Name -match 'Debian*' } | Start-Vm
Get-Vm | Where-Object { $_.Name -match 'Alpine*' } | Start-Vm
```
