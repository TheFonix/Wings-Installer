#Variables:
DAEMONVERSION="0.4.2"

echo "Welcome! The installer will start in 2 seconds!"
sleep 2

echo " Install and configuring the Docker installer!"
curl -sSL https://get.docker.com/ | sh
sleep 1

echo "Setting Docker to run as a system service"
systemctl enable docker
sleep 1

echo "Downloading NodeJS + Installing"
curl -sL https://deb.nodesource.com/setup_6.x | bash -
sleep 1

echo "Using APT service to install NODEJS into current system"
apt -y install nodejs
sleep 1

echo "Installing other dependencies for the Wings Daemon"
apt -y install tar unzip make gcc g++ python
sleep 1

echo "Creating the Daemon and Daemon Data Folders
mkdir -p /srv/daemon /srv/daemon-data
sleep 1

echo " Moving to the Daemon DIrectory"
cd /srv/daemon
sleep 1

echo "Downloading $DAEMONVERSION to the Daemon directory"
curl -Lo vDAEMONVERSION.tar.gz https://github.com/Pterodactyl/Daemon/archive/v$DAEMONVERSION.tar.gz
sleep 1

echo "Stripping down $DAEMONVERSION Tar contents"
tar --strip-components=1 -xzvf v$DAEMONVERSION.tar.gz
sleep 1

echo "Installing the Daemon on the Wings Daemon (We are nearly there! xD)"
npm install --only=production
sleep 1

echo""
echo""
echo""
echo""
echo"Daemon has been installed! If you saw any errors above you should no doubt check out what went wrong!"
echo""
echo""
sleep 2

#echo "Attempting to Daemonize the Wings Daemon" 

sleep 
