#!/bin/bash

# k6 repo setup
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
echo "deb https://dl.bintray.com/loadimpact/deb stable main" | sudo tee -a /etc/apt/sources.list

# mongo-shell deb setup
wget -O mongodb-shell.deb https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/4.2/multiverse/binary-amd64/mongodb-org-shell_4.2.1_amd64.deb
sudo dpkg -i mongodb-shell.deb

# mysql-shell deb setup
wget -O mysql-shell.deb https://dev.mysql.com/get/Downloads/MySQL-Shell/mysql-shell_8.0.18-1ubuntu18.04_amd64.deb
sudo dpkg -i mysql-shell.deb

# ansible install
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

# k6 install
sudo apt-get install k6

# mongodb-shell install
sudo apt install mongodb-shell
# mysql-shell install
sudo apt install mysql-shell

