starttime=$(date +%s)
time=$(date '+%H:%M:%S')

echo "[$time] Install my Bash theme"
{
	echo 'PATH=$PATH:/usr/local/vesta/bin'
	echo 'export PATH'
	echo 'export PS1="\[\e[37m\][\[\e[m\]\[\e[36m\]\T\[\e[m\]\[\e[37m\]]\[\e[m\] \[\e[31m\]\u\[\e[m\]\[\e[35m\]:\[\e[m\]\[\e[34m\]\w\[\e[m\]\[\e[31m\]\\$\[\e[m\] \n"'
	echo 'if [ -x /usr/bin/dircolors ]; then'
	echo '    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"'
	echo '    alias ls='ls --color=auto''
	echo 'fi'
} > ~/.bashrc
source ~/.bashrc
sleep (1)

echo ""
echo "[$time] Clean MOTD"
echo "\n\n\n" >> /etc/motd
source /etc/motd

echo ""
echo "[$time] Update"
sleep (1)
apt-get update

echo ""
echo "[$time] Install mc, screen, htop, sudo"
sleep (1)
apt-get install mc screen htop sudo

echo ""
echo "[$time] Install LAMP"
sleep (1)
sudo apt-get install apache2 php php-mysql libapache2-mod-php php-mbstring php-zip php-gd phpmyadmin
sudo apt-get install mysql-server mysql-client mysql-common

echo ""
echo "[$time] Java preinstall"
sleep (1)
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list

echo ""
echo "[$time] Update"
sleep (1)
apt-get update

echo ""
echo "[$time] Install Java 8"
sleep (1)
apt-get install oracle-java8-installer

echo ""
echo "[$time] Preconfigurate Server"
mkdir /home/Server
echo "eula=true" /home/Server/eula.txt

echo ""
echo "[$time] Install BuildTools"
mkdir /home/BuildTools/
curl -0 https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar > /home/BuildTools/BuildTools.jar

mkdir /home/backup/
mkdir /home/manage/

echo ""
echo "[$time] Download manage skript"
curl -o https://raw.githubusercontent.com/BrainRTP/Debian8-AutoInstallMC/master/start.sh > /home/manage/stat.sh
curl -o https://raw.githubusercontent.com/BrainRTP/Debian8-AutoInstallMC/master/backup.sh > /home/manage/backup.sh
curl -o https://raw.githubusercontent.com/BrainRTP/Debian8-AutoInstallMC/master/cleaner.sh > /home/manage/cleaner.sh

echo ""
echo "[$time] Install Spigot latest build"
sleep (1)
java -jar /home/BuildTools/BuildTools.jar --rev latest
cp 

echo ""

echo "[$time] The script is executed in $(($(date +%s)-$starttime)) seconds"