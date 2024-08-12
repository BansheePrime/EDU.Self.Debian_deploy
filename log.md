# logging

## TODO

### NB

usermod in /usr/sbin

### Installing GPG (gnupg2) on a Debian Linux to fix gpg command not found error

<https://www.cyberciti.biz/faq/installing-gnupg2-on-debian-linux-to-fix-bash-gpg-command-not-found-error/>

### Installing Ansible on Debian

<https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html>

#### Ansible on Debian 12 from Ubuntu repository

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
