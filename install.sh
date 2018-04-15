#!/bin/bash
SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
	echo "Need to run as root."
	$SUDO $0
fi
echo -e "\e[31mPress enter to start installation...\e[0m"
read ok
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)

if [[ ! -z $YUM_CMD ]]; then
    sudo yum update -y
    sudo yum figlet -y
    sudo yum install curl -y
    sudo yum install coreutils -y
elif [[ ! -z $APT_GET_CMD ]]; then
    sudo apt-get update -y
    sudo apt-get install figlet -y
    sudo apt-get install curl -y
    sudo apt-get install coreutils -y
else
    echo "Idfk what to do, piss off, install a less shit dist."
    exit
fi
chmod 777 *
echo "Do you want me to set up an alias for code.sh, so you can execute it where ever you're located on your system? [Y/n]"
read alias
if [ -z $alias ]
   then
    alias='Y'
elif [ $alias == 'Y' ]
   then
     location=$(readlink -f $0)
     path=`dirname $location`
     echo "alias code.sh='$path/code.sh'" >> ~/.bashrc
     echo "Alias of $path/code.sh set to code.sh."
elif [ $alias == 'y' ]
   then
     location=$(readlink -f $0)
     path=`dirname $location`
     echo "alias code.sh='$path/code.sh'" >> ~/.bashrc
     echo "Alias of $path/code.sh set to code.sh."
else
   echo "Skipping alias setup."
fi
echo "You're all set."
echo ""