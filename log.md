# logging

## TODO

- Define tasks <https://www.redhat.com/sysadmin/build-VM-fast-ansible>

### NB

usermod in /usr/sbin

### Installing GPG (gnupg2) on a Debian Linux to fix gpg command not found error

<https://www.cyberciti.biz/faq/installing-gnupg2-on-debian-linux-to-fix-bash-gpg-command-not-found-error/>

### Installing Ansible on Debian

<https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html>

#### Ansible on Debian 12 from Ubuntu repository

##### NB gpg may be gnupg

```bash
UBUNTU_CODENAME=jammy
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/ansible.list

sudo apt update && sudo apt install ansible
```

### To read: Build a lab in 36 seconds with Ansible

<https://www.redhat.com/sysadmin/build-VM-fast-ansible>

### To read: How to Install KVM on MXLinux Latest

<https://ipv6.rs/tutorial/MXLinux_Latest/KVM/>

### How to Install KVM on Ubuntu

<https://phoenixnap.com/kb/ubuntu-install-kvm>

### How to use bridged networking with libvirt and KVM

<https://linuxconfig.org/how-to-use-bridged-networking-with-libvirt-and-kvm>

## THE LOG

```bash
ansible-playbook -i ./inventories/inventory.yaml ./playbooks/dotfiles-playbook.yaml --check
ansible-playbook -i ./inventories/inventory.yaml ./playbooks/app-playbook.yaml --become-password-file secure_key
```

```bash
echo -en 'first line\nsecond line\nthird line\n' > file.echo
printf '%s\n' 'first line' 'second line' 'third line' > file.printf
```

```bash
cat > file.eof << 'EOF'
first line
second line
third line
EOF
```

```bash
sudo ls -lAh /var/lib/libvirt/images
```

### Define a VM template <https://www.redhat.com/sysadmin/build-VM-fast-ansible>

To provision a KVM VM using Ansible, use the community.libvirt.virt module. This module requires a VM definition in XML format according to the syntax of libvirt. The most convenient way to get this file is to dump an existing VM definition using the command `virsh dumpxml`.

- see file *./kvmlab/roles/kvm_provision/templates/vm-template.xml.j2*

### Create directories structure with bash

```bash
eval "mkdir -p foundryvtt_deploy/{playbooks/dotfiles/,scripts,inventories}"
```

### Upgrade all pip packages NB: check you are in right virtual env

```bash
pip freeze > requirements.txt
pip install -r requirements.txt --upgrade

```

### Ansible role NGINX

<https://github.com/nginxinc/ansible-role-nginx>

### Molecule

**Molecule is used to test the various functionalities of the role.**
<https://ansible.readthedocs.io/projects/molecule/getting-started/>

### updating pip apps

```bash
pip list --outdated
pip install setuptools --upgrade
pip install pip --upgrade
```

### Usefull reading 

- A script to generate a debian 9 iso with a preseed.cfg
<https://www.reddit.com/r/debian/comments/847l9d/a_script_to_generate_a_debian_9_iso_with_a/>

```bash
perl -e 'use Crypt::PasswdMD5;print("userPassword: {CRYPT}".unix_md5_crypt("password","salt")."\n");'
```

```bash
sudo apt install whois
makepasswd
```
- Set of scripts to remaster Debian iso images.
<https://github.com/unixabg/remaster-iso>

<https://superuser.com/questions/379761/install-linux-alternative-os-on-headless-server>

```bash
wget https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.7.0-amd64-netinst.iso
```
Mounting an ISO file requires mapping its data to a loop device. Attach an ISO file to a mount point using a loop device by passing the -o loop option:
```bash
sudo mount -o loop -t iso9660 ./debian-12.7.0-amd64-netinst.iso ./debi
```
```bash
mkdir ./preseededISO
rsync -a -H –exclude=TRANS.TBL ./debi ./preseededISO
# // -a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
# // -H, --hard-links            preserve hard links
# // TRANS.TBL - an extension to ISO9660 for better compability with older systems
```
*Edit files*
*Update md5sum.txt*
```bash
md5sum
```
