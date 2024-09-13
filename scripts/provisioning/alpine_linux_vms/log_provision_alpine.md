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

### Post Installation Recommendations

<https://docs.alpinelinux.org/user-handbook/0.1a/Working/post-install.html>

#### Creating a Normal User

```bash
apk add doas
echo 'permit :wheel' > /etc/doas.d/doas.conf
adduser joe -G wheel
su -l joe
```

Quoting:

- doas is not installed by default.
- by default, doas only provides permissions to root. This translates as "people in the group wheel are allowed to perform any command, as any user, and any group."
- The wheel group mentioned above is the common "administrator" group, and since we’re using it, we need to add our user to said group.
