
#Check the user is Root (0)
if [[ $EUID -ne 0 ]]; then
   echo "Sorry you must run this script as root!" 
   exit 1
fi

#Warn the user of a possible un supported OS
echo "=============================================================================="
echo "Please note this script is not to be ran on any other system than Ubuntu 16.04!"
echo "=============================================================================="
sleep 2

# Apt installer
echo "Installing other dependencies for the Wings Daemon"
apt -y install tar unzip make gcc g++ python zip curl
sleep 1

#A kind welcome message!
echo "Welcome! The installer will start in 2 seconds!"
sleep 2

#Docker one line installation
echo " Install and configure the Docker"
curl -sSL https://get.docker.com/ | sh
sleep 1

#Adding the Docker service to systemd
echo "Setting Docker to run as a system service"
systemctl enable docker
sleep 1

#Install NodeJs
echo "Downloading NodeJS + Installing"
curl -sL https://deb.nodesource.com/setup_6.x | bash -
sleep 1

#Install Nodejs
echo "Using APT service to install NODEJS into current system"
apt -y install nodejs
sleep 1

#Create the daemon directories
echo "Creating the Daemon and Daemon Data Folders"
mkdir -p /srv/daemon /srv/daemon-data
sleep 1

#Check the daemon folder is empty, if not make a backup
if [ "$(ls -A /srv/daemon)" ]; then
     echo "- = Data has been found inside the Daemon folder! Creating a backup! = - "
     sleep 2
     cd /srv && zip -r PreviousDaemonDirectory.zip daemon && rm -rf daemon && mkdir -p mkdir && cd /srv/daemon
     echo "Backup has been complete, carrying on with installer!"
else
    echo "Daemon folder is empty, carrying on with the installer!"
    cd /srv/daemon
fi

#Download the Wings tar
echo "Downloading 0.4.5 to the Daemon directory"
curl -Lo v0.4.5.tar.gz https://github.com/Pterodactyl/Daemon/archive/v0.4.5.tar.gz
sleep 1

#De-compress the wings data
echo "Stripping down 0.4.5 Tar contents"
tar --strip-components=1 -xzvf v0.4.5.tar.gz
sleep 1

#Run NPM install for the daemon
echo "Installing the Daemon on the Wings Daemon (We are nearly there! xD)"
npm install --only=production
sleep 1

#Download a pre-setup service file
echo "Creating system Service for the wings daemon"
sleep 2
curl https://raw.githubusercontent.com/TheFonix/Wings-Demonizer/master/daemonize.sh |sh

echo ""
echo ""
echo ""
echo ""
echo "Daemon has been installed! If you saw any errors above you should no doubt check out what went wrong!"
echo ""
echo "You should now add a core.json file into the config directory, this would of been generated by the panel!"
echo ""
sleep 2
