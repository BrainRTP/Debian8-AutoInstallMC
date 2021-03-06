starttime=$(date +%s)
time=$(date '+%H:%M:%S')
BLACK='\033[0;30m'     #  ${BLACK}    # чёрный цвет знаков
RED='\033[0;31m'       #  ${RED}      # красный цвет знаков
GREEN='\033[0;32m'     #  ${GREEN}    # зелёный цвет знаков
YELLOW='\033[0;33m'     #  ${YELLOW}    # желтый цвет знаков
BLUE='\033[0;34m'       #  ${BLUE}      # синий цвет знаков
MAGENTA='\033[0;35m'     #  ${MAGENTA}    # фиолетовый цвет знаков
CYAN='\033[0;36m'       #  ${CYAN}      # цвет морской волны знаков
GRAY='\033[0;37m'       #  ${GRAY}      # серый цвет знаков
NORMAL='\033[0m'      #  ${NORMAL}    # все атрибуты по умолчанию

echo -en "[$time] ${RED}Install my Bash theme ${NORMAL}"
echo ""
{
	echo 'PATH=$PATH:/usr/local/vesta/bin'
	echo 'export PATH'
	echo 'export PS1="\[\e[37m\][\[\e[m\]\[\e[36m\]\T\[\e[m\]\[\e[37m\]]\[\e[m\] \[\e[31m\]\u\[\e[m\]\[\e[35m\]:\[\e[m\]\[\e[34m\]\w\[\e[m\]\[\e[31m\]\\$\[\e[m\] "'
	echo 'if [ -x /usr/bin/dircolors ]; then'
	echo '    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"'
	echo '    alias ls='ls --color=auto''
	echo 'fi'
} > ~/.bashrc
source ~/.bashrc
sleep 1

echo ""
echo -en "[$time] ${RED}Clean MOTD ${NORMAL}"
echo ""
echo "\n\n\n" >> /etc/motd
source /etc/motd

echo ""
echo -en "[$time] ${RED}Update ${NORMAL}"
echo ""
sleep 1
apt-get update

echo ""
echo -en "[$time] ${RED}Install mc, screen, htop, sudo, git ${NORMAL}"
echo ""
sleep 1
apt-get install mc screen htop sudo git

echo ""
echo -en "[$time] ${RED}Install LAMP ${NORMAL}"
echo ""
sleep 1
sudo apt-get install apache2 php php-mysql libapache2-mod-php php-mbstring php-zip php-gd phpmyadmin
sudo apt-get install mysql-server mysql-client mysql-common

echo ""
echo -en "[$time] ${RED}Java preinstall ${NORMAL}"
echo ""
sleep 1
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list

echo ""
echo -en"[$time] ${RED}Update ${NORMAL}"
echo ""
sleep 1
apt-get update

echo ""
echo -en "[$time] ${RED}Install Java 8 ${NORMAL}"
echo ""
sleep 1
apt-get install oracle-java8-installer

echo ""
echo -en "[$time] ${RED}Preconfigurate Server ${NORMAL}"
echo ""
mkdir /home/Server
echo "eula=true" > /home/Server/eula.txt

echo ""
echo -en "[$time] ${RED}Install BuildTools ${NORMAL}"
echo ""
mkdir /home/BuildTools/
curl -0 https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar > /home/BuildTools/BuildTools.jar

mkdir /home/backup/
mkdir /home/manage/

echo ""
echo -en "[$time] ${RED}Download manage skript ${NORMAL}"
echo ""
curl -0 https://raw.githubusercontent.com/BrainRTP/Debian8-AutoInstallMC/master/start.sh > /home/manage/stat.sh
curl -0 https://raw.githubusercontent.com/BrainRTP/Debian8-AutoInstallMC/master/backup.sh > /home/manage/backup.sh
curl -0 https://raw.githubusercontent.com/BrainRTP/Debian8-AutoInstallMC/master/cleaner.sh > /home/manage/cleaner.sh

echo ""
echo -en "[$time] ${RED}Install Spigot latest build ${NORMAL}"
echo ""
sleep 1
java -jar /home/BuildTools/BuildTools.jar --rev latest
cp 

echo ""
echo -en "[$time] ${RED}The script is executed in ${GREEN}$(($(date +%s)-$starttime)) ${RED}seconds ${NORMAL}"
echo ""