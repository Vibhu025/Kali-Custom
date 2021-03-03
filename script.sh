#!/bin/bash

print () {
		echo "[----------------------------------------------------------------------------------]"
        echo "[+]" $1 
}

----------------------------------------------------
# exit when any command fails
set -e
----------------------------------------------------
# To be Done When using Kali 2019.3 or Previous Version

# gpg --keyserver hkp://keys.gnupg.net --recv-key 7D8D0BF6;
# gpg --fingerprint 7D8D0BF6;
# gpg -a --export 7D8D0BF6 | apt-key add - ;
----------------------------------------------------
# Change to XFCE

# sudo apt update && sudo apt install -y kali-desktop-xfce
# update-alternatives --config x-session-manager
# select Xfce’s option
----------------------------------------------------


print "Getting Necessary Permissions"
sudo apt install -y kali-grant-root && sudo dpkg-reconfigure kali-grant-root
print "Done"

print "Updating and Upgrading System to Latest Version"
echo "deb https://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list;
sudo apt-get update && sudo apt-get -y full-upgrade && sudo apt-get autoremove -y && sudo apt-get autoclean;
print "Done"













