#!/usr/bin/env bash
echo "Press CTRL+C to proceed."
trap "pkill -f 'sleep 1h'" INT
trap "set +x ; sleep 1h ; set -x" DEBUG

# YOUR CODE HERE 
# To stop the script you would have to kill it from another shell 
sudo apt update 
sudo apt upgrade
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
sudo kvm-ok
# Correct output: INFO: /dev/kvm exists KVM acceleration can be used
sudo virt-manager
