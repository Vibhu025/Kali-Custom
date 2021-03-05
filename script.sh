#!/bin/bash

print () {
	echo "[----------------------------------------------------------------------------------]"
        echo "[+]" $1 
        echo "[----------------------------------------------------------------------------------]"
}

# ----------------------------------------------------
# exit when any command fails
set -e
# ----------------------------------------------------
# To be Done When using Kali 2019.3 or Previous Version

# gpg --keyserver hkp://keys.gnupg.net --recv-key 7D8D0BF6;
# gpg --fingerprint 7D8D0BF6;
# gpg -a --export 7D8D0BF6 | apt-key add - ;
# ----------------------------------------------------
# Change to XFCE

# sudo apt update && sudo apt install -y kali-desktop-xfce
# update-alternatives --config x-session-manager
# select Xfce’s option
# ----------------------------------------------------


#print "Getting Sudo Permissions to Normal User"
#sudo apt install -y kali-grant-root && sudo dpkg-reconfigure kali-grant-root
#print "Done"

print"Transferring zshrc"
cp zshrc ~/.zshrc;
print"Done"

print "Updating and Upgrading System to Latest Version"
echo "deb https://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list;
sudo apt-get update && sudo apt-get -y full-upgrade && sudo apt-get autoremove -y && sudo apt-get autoclean;
print "Done"

print "Installing Necessary Tools"
sudo apt-get install -y git python3-pip powershell sshuttle default-jdk apt-transport-https plank htop xclip steghide gdb binwalk checksec exiftool ruby seclists;
sudo gzip -d /usr/share/wordlists/rockyou.txt.gz;
sudo mkdir /opt/tools;
print "Done"

print "Installing Golang"
cd ~/Downloads;
goversion=$(curl https://golang.org/doc/install -s | grep -i "var goVersion =" | grep '".*"' -o | sed 's/"//g');
wget https://storage.googleapis.com/golang/$goversion.linux-amd64.tar.gz;
sudo tar -C /usr/local -xzf $goversion.linux-amd64.tar.gz;
sudo rm -r $goversion.linux-amd64.tar.gz;
print "Done"

print "Installing Golang tools"
cd ~/
go get github.com/ffuf/ffuf -v;
go get github.com/OJ/gobuster -v;
print "Done"

print "Installing Python modules"
pip3 install requests;
pip3 install pwntools;
print "Done"

print "Installing Ghidra"
ghidraversion=$(curl https://ghidra-sre.org/ -s | grep -i latest | grep -o '".*"' | awk '{print$1}' | sed 's/"//g');
wget https://ghidra-sre.org/$ghidraversion -O /opt/tools/ghidra.zip;
cd /opt/tools/;
unzip ghidra.zip;
rm -r ghidra.zip;
sudo mv ghidra* Ghidra;
sudo ln -s /opt/tools/Ghidra/ghidraRun /usr/sbin/ghidra;
print "Done"

print "Installing Tools"
sudo gem install evil-winrm;
print "Done"

print "Downloading Recon Scripts"
mkdir /opt/enum_scripts;
cd /opt/enum_scripts;
sudo git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git;
print "Done"

print "Installing Sublime Text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - ;
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list;
sudo apt-get update && sudo apt-get install sublime-text;
print "Done"

