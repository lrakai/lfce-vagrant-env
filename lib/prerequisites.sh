#!/bin/bash
VAGRANT_VERSION=2.2.14
VAGRANT_FILENAME="vagrant_${VAGRANT_VERSION}_x86_64.rpm"
VB_VERSION="6.1"
############################################################
### VIRTUALBOX

# Install VB if not already present
if ! virtualboxvm --help 1>/dev/null; then
    sudo yum install -y gcc dkms make qt libgomp patch
    sudo yum install -y kernel-headers kernel-devel binutils glibc-headers glibc-devel font-forge

    cd /etc/yum.repos.d/ || exit 1
    sudo wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
    sudo yum -y update
    sudo yum –y install VirtualBox-$VB_VERSION

    # It could be necessary to reinstall a specific kernel-devel package
    sudo /sbin/vboxconfig
fi


############################################################
#### VAGRANT
if ! vagrant version; then
    wget https://releases.hashicorp.com/vagrant/$VAGRANT_VERSION/$VAGRANT_FILENAME  --directory-prefix=/tmp/
    sudo yum install -y /tmp/$VAGRANT_FILENAME
    rm /tmp/vagrant*
fi
