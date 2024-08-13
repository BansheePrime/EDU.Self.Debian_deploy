#!/usr/bin/env bash
echo "Press CTRL+C to proceed." # I dont like option Ctrl+C
trap "pkill -f 'sleep 1h'" INT
trap "set +x ; sleep 1h ; set -x" DEBUG

# YOUR CODE HERE 
# To stop the script you would have to kill it from another shell 
sudo apt update 
sudo apt upgrade
sudo apt install qemu-kvm qemu-utils libvirt-daemon-system libvirt-clients bridge-utils virt-manager cpu-checker
sudo kvm-ok
# Correct output: INFO: /dev/kvm exists KVM acceleration can be used
sudo adduser $USER libvirt
sudo adduser $USER kvm
sudo virsh list --all
# sudo systemctl status libvirtd # MX Linux use systemd
sudo service libvirtd status
# Bridged network - bridge-utils
sudo virsh net-list --all
sudo ip link add br0 type bridge
sudo ip link show type bridge # verify
sudo ip link set eth1 master br0 # kaizer net

#
sudo apt install gir1.2-spiceclientgtk-3.0
#
sudo virt-manager # if $USER absent in libvirt and kvm groups
