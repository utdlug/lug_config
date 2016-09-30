#!/bin/bash

# Wait until we can talk to the repo
while true; do
    if ping -c1 lug.utdallas.edu ; then
        break
    fi
    sleep 5
done

# This script runs the first boot install tasks on the hardware
xbps-install -R https://lug.utdallas.edu/mirror/void/current -Syu
xbps-install -R https://lug.utdallas.edu/mirror/void/current -Syu
xbps-install -R https://lug.utdallas.edu/mirror/void/current -y curl git-all python python-devel python-pip libressl-devel base-devel

# Install ipaddr filter for python
pip install ansible netaddr

# Attempt to run the main ansible installer
ansible-pull -U https://github.com/utdlug/lug_config.git workstation.yml

# Remove the firstboot script
rm -rf /etc/sv/firstboot
rm -rf /var/service/firstboot

# Reboot so that everything starts up cleanly
shutdown -r now
