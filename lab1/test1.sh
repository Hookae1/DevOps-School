#!/bin/bash

#Tell to the script to stop processing in case of non-true value
set -e

#Enter <user name>
read -p "Enter user name: " x

#Checks root permissions

root_check() {
 	 if ( $UID != 0 ); then
    		echo -en "\033[31;47;1m User '$x' doesn't have root permissions"
   		exit 1
   	 fi
}
#User ckecking function

user_check(){
 	if id "$x" &>/dev/null; then
		echo "User '$x' exists" >/dev/null
	else
		echo -en "\033[31;47;1m User '$x' doesn't exists"
		exit 1
	fi
}

user_check '$x'

#Enter <directory name>
read -p "Enter directory name: " y

#Directory checking function

dir_check(){
	if [ -d "$y" ]; then
		echo "Directory "$y"' exist" >/dev/null
	else
		echo -en "\033[31;47;1m Directory "$y" doesn't exist"
		exit 1
	fi
}

dir_check '$y'

#Recursive changing owners of the directory

if user_check "$"x && dir_check "$y"; then
	chown -R "$x":"$x" "$y" &>/dev/null 
	echo -en "\033[42;34;2m !!User "$x" was Successfully set for Directory "$y"!!"
fi
