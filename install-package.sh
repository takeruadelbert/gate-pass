#!/bin/bash

# make script executable
sudo chmod +x install-package.sh

# install mysql-server if it's not installed yet
if [ -f /etc/init.d/mysql* ]; then
	echo "mysql-server is already installed."
else
	echo "Installing mysql-server..."
	sudo apt-get install mysql-client
	echo "Successfully installed mysql-server."
fi

# install required packages for Python 3
declare -a packages=("mysql-connector" "xlsxwriter" "tkcalendar" "babel")
for i in "${packages[@]}"
do
#	echo "$i"
	echo "Installing $i ..."
	sudo pip3 install "$i"
done

echo "Done Installing all required packages."
