sudo add-apt-repository ppa:webupd8team/unstable
sudo add-apt-repository ppa:mumble/release
sudo add-apt-repository ppa:andreas-diesner/garminplugin
sudo add-apt-repository ppa:ansible/ansible
sudo add-apt-repository ppa:chromium-daily/stable

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
sudo sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"

sudo add-apt-repository ppa:linphone/release

#sudo add-apt-repository ppa:modycz/heimdall

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

sudo add-apt-repository ppa:stefansundin/truecrypt


wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
sudo sh -c "echo \"deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) non-free contrib\" >> /etc/apt/sources.list.d/virtualbox.org.list"


#wget -q -O - http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo  apt-key add -
#echo "deb http://repo.vivaldi.com/stable/deb/ stable main" | sudo tee /etc/apt/sources.list.d/vivaldi.list

#sudo add-apt-repository ppa:webupd8team/atom

sudo add-apt-repository ppa:webupd8team/java

sudo add-apt-repository ppa:webupd8team/terminix

sudo add-apt-repository ppa:xubuntu-dev/xfce-4.12

# Go


sudo apt update

sudo apt -y install vim

#sudo apt -y install guake

sudo apt install -y mumble

sudo apt install -y garminplugin

sudo apt install -y ansible

sudo apt install -y chromium-browser 

sudo apt install -y docker-ce

sudo apt install -y google-talkplugin

sudo apt -y install jitsi

sudo apt -y install linphone

sudo apt -y install sbt

sudo apt -y install truecrypt

sudo apt -y install virtualbox

#sudo apt -y install atom

#sudo apt -y install vivaldi-stable

sudo apt -y install oracle-java7-installer 
#sudo apt -y install oracle-java9-installer
sudo apt -y install oracle-java8-installer

sudo apt install -y tilix
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

sudo apt install -y cpufrequtils

sudo apt install -y screen vim

sudo apt full-upgrade -y

sudo apt autoremove
sudo apt autoclean


