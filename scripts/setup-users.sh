#!/usr/bin/bash

set -e

NEW_USER="$1"
NEW_PASSWORD="$2"

sudo useradd -m -s /bin/bash $NEW_USER
cp -pr /home/vagrant/.ssh /home/$NEW_USER/
chown -R $NEW_USER:$NEW_USER /home/$NEW_USER
echo "$NEW_USER:$NEW_PASSWORD" | sudo chpasswd
sudo usermod -aG wheel $NEW_USER
echo "%$NEW_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$NEW_USER
echo "User $NEW_USER created and added to sudo group."

sudo su -
echo "vagrant:$NEW_PASSWORD" | chpasswd
su - $NEW_USER
