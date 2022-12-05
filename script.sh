#!/bin/bash

pvcreate /dev/sdc /dev/sdd /dev/sde /dev/sdf
vgcreate group /dev/sdc /dev/sdd /dev/sde /dev/sdf

lvcreate -l 100%FREE group /dev/sdc /dev/sdd -n volum1
lvcreate -l 100%FREE group /dev/sde /dev/sdf -n volum2

mkfs.ext4 /dev/group/volum1
mkfs.ext4 /dev/group/volum2

mkdir -p /mnt/volum1 /mnt/volum2

echo '/dev/group/volum1 /mnt/volum1 ext4 defaults 0 0' >> /etc/fstab
echo '/dev/group/volum2 /mnt/volum2 ext4 defaults 0 0' >> /etc/fstab

mount -a