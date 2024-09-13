# setup-alpine

<https://docs.alpinelinux.org/user-handbook/0.1a/Installing/setup_alpine.html>
<https://github.com/alpinelinux/alpine-conf/blob/master/setup-alpine.in>

## alpine wonders

Start powershell script with:

```powershell
.\provision_alpine_vm1.ps1 -ExecutionPolicy Bypass
```

1. Setup network interface ("a" stands for "auto").

```bash
setup-interfaces -a
```

2. Repositories

```bash
setup-apkrepos
```

3. Install openssh

```bash
apk add name
```

-- Optional^ start service and add enable it

```bash
rc-service openssh start
rc-update add openssh
```

4. Copy preseed_alpine.cfg and ssh-key

```bash
scp ./preseed_alpine.cfg ALPINE_VM:
```

### **BEFORE** poweroff

1. setup-alpine -f ANSWER_FILE

```bash
poweroff
```

### **POST** poweroff

By hands or by script
[] unmount .iso
[] change boot order to .vhdx

```powershell
$VMName = 'AlpinePrimus'
$BootDevice = 'C:\Virtual Hard Disks\AlpinePrimus.vhdx'
Set-VMFirmware -VMName $VMName -FirstBootDevice $BootDevice
Get-VMDvdDrive -VMName $VMName | Set-VMDvdDrive -Path $null
```

[-FirstBootDevice `<VMComponentObject`>]
Should I write it as VMHardDiskDrive or as path to .vhdx ?