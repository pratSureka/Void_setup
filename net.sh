#!/bin/bash
set -e

#NetworkManager
sudo bps-install -S NetworkManager network-manager-applet gnome-icon-theme inetutils-ifconfig gnome-keyring

#sudo echo 'polkit.addRule(function(action, subject) {
#  if (action.id.indexOf("org.freedesktop.NetworkManager.") == 0 && subject.isInGroup("network")) {
#    return polkit.Result.YES;
#  }
#});' > /etc/polkit-1/rules.d/50-org.freedesktop.NetworkManager.rules

#Adding user to network group
sudo gpasswd -a $USER network

#Removing unnecessary services
sudo rm -fr /var/service/dhcpcd
sudo rm -fr /var/service/wpa_supplicant

#Adding Services
sudo ln -s /etc/sv/NetworkManager /var/service
sudo ln -s /etc/sv/dbus /var/service
