#!/bin/bash

#Tell to the script to stop processing in case of non-true value
set -e

#Enter <user name>
read -p "Enter user name: " x

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

#If both of the paramters is TRUE - Recursive change owner of the folder

if user_check "$"x && dir_check "$y"; then
	sudo chown -R "$x" "$y" &>/dev/null 
	echo -en "\033[42;34;2m !!User "$x" was Successfully set for Directory "$y"!!"
fi
