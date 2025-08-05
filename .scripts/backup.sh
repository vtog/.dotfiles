#!/bin/bash

backupFile=$HOME/$(date +'%Y%m%d-'$(hostname --short)'-backup.tar.gz')

list=$(ls -d $HOME/libvirt/ -d $HOME/OCP/ -d /etc/named/ -f /etc/named.conf \
  -f /etc/chrony.conf -f /etc/hosts \
  -f /mirror/oc-mirror/*.{sh,yaml} -f /opt/AdGuardHome/AdGuardHome.yaml \
  2>/dev/null)
echo -e "\nFound the following for backup:\n\n$list\n"

echo $list | xargs tar --exclude="*.tar.gz" --exclude "*tar" --exclude="*.iso" --exclude="*.raw" \
  --exclude="*.qcow2" --exclude="*.img" --exclude="openshift-install*" --exclude="cache" \
  --exclude="temp" -czvvf $backupFile \
  2>backup_errors.txt

#tar --exclude="*.tar.gz" --exclude "*tar" --exclude="*.iso" -czvf $backupFile \
#$HOME/libvirt $HOME/OCP /etc/named /etc/named.conf /etc/chrony.conf /etc/hosts /opt/AdGuardHome/AdGuardHome.yaml

if [ -d /mnt/perl ]; then
  mv $backupFile /mnt/perl
fi
