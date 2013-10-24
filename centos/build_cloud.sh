#!/bin/bash

# add the EPEL repo and update
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y update

# install cloud-init
yum -y install cloud-init
yum -y install rsync

# add the ec2-user (default for cloud-init)
adduser ec2-user
mkdir /home/ec2-user/.ssh/
chown -R ec2-user.ec2-user .ssh

exit
# clean up the network interface stuff
rm /etc/udev/rules.d/70-persistent-net.rules

# wipe the passwords
passwd -l root
passwd -l ec2-user
