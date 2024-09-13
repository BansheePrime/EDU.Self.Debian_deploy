# setup-alpine

<https://docs.alpinelinux.org/user-handbook/0.1a/Installing/setup_alpine.html>
<https://github.com/alpinelinux/alpine-conf/blob/master/setup-alpine.in>
<https://stackoverflow.com/questions/53034988/powershell-script-ssh-into-server>

Good list of Post-Installation steps
<https://wiki.alpinelinux.org/wiki/Installation#Installation_Overview>

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
setup-apkrepos -1
```

3. Install openssh

```bash
apk add openssh
```

-- Optional^ start service and add enable it

```bash
rc-service openssh start
rc-update add openssh
```

4. Copy preseed_alpine.cfg and ssh-key

```bash
scp ./preseed_alpine.cfg ALPINE_VM:
scp ./set_alpine_vm.sh ALPINE_VM:
```

### **BEFORE** poweroff

1. setup-alpine -f preseed_alpine.cfg
2. launch set_alpine_vm.sh
    - *ignore* create user
    - *ignore* add user to wheel
    - *ignore* install doas
        *ignore* ```sh permit :wheel``` // Looks like it is default state
    - *ignore* copy ssh keys for new user
3. log ip in ansible inventory
4. ansible ping

```bash
ansible primus -i ./inventories/inventory.yaml -m ping
```

```bash
poweroff
```

### **POST** poweroff

By hands or by script
[*] unmount .iso
[] change boot order to .vhdx
[] log new alpine vm in ansible inventory
[] 

**NB** After ejecting .iso *VMDvdDrive* Correct boot device set automatically
**NB** But boot order - different beast.
```powershell
$VMName = 'AlpinePrimus'
$BootDevice = 'C:\Virtual Hard Disks\AlpinePrimus.vhdx'
Get-VMDvdDrive -VMName $VMName | Set-VMDvdDrive -Path $null
```

NOT **Working as intended code:**

```powershell
Get-VMHardDiskDrive -VMName $VMName
$BootDevice = Get-VMHardDiskDrive -VMName $VMName
Set-VMFirmware -VMName $VMName -FirstBootDevice $BootDevice
```

[-FirstBootDevice `<VMComponentObject`>]
Should I write it as VMHardDiskDrive or as path to .vhdx ?

### Post Installation Recommendations

<https://docs.alpinelinux.org/user-handbook/0.1a/Working/post-install.html>

#### Creating a sudo User

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
