#!/bin/bash
if [ -z $1 ]
	then
		echo -e "\e[31m"
		figlet code.sh
		echo -e "\e[0m"
		echo ""
		echo -e "Usage: $0 <\e[31mhostname\e[0m or \e[31mIP\e[0m> <\e[31mhttp\e[0m or \e[31mhttps\e[0m (default: \e[31mhttp\e[0m)>"
		exit
fi
if [ -z $2 ]
	then
		echo "$1: $(curl -Is http://$1 | head -1)"
		echo "www.$1: $(curl -Is http://www.$1 | head -1)"
elif [ $2 == 'https' ]
	then
		echo "$1: $(curl -Is https://$1 | head -1)"
		echo "www.$1: $(curl -Is https://www.$1 | head -1)"
elif [ $2 == 'http' ]
	then
		echo "$1: $(curl -Is http://$1 | head -1)"
                echo "www.$1: $(curl -Is http://www.$1 | head -1)"
else
	echo "Something went wrong with the second argument, make sure it's either set to http or https or left empty."
fi
exit
