#!/bin/bash

echo ----------Add script service to Service Folder --------
sudo cp /home/ubuntu/env/mongodb/mongod.service /etc/systemd/system
sudo systemctl daemon-reload

echo -------------- Import the public key for APT ---------------
sudo wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

echo ---------------- Create list file for MongoDV --------------
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list


echo ------------------------ Update packages -------------------
sudo apt-get update && sudo apt-get upgrade


echo ------------------------ Install Mongo ---------------------
# apt-get install -y mongodb-org-database
#sudo apt-get install -y mongodb-org-server
#sudo apt-get install -y mongodb-org-mongos
sudo apt-get install -y mongodb-org


echo -------Check file path--------------
sudo find / -name "mongod.conf"
sudo find / -name "mongod.service"

echo --------------- Remove Exsiting Conf File ------------------
 sudo rm /etc/mongod.conf

 echo ---------------------- Copy New Conf File ------------------
 sudo ln -s /home/ubuntu/env/mongodb/mongod.conf /etc/mongod.conf

  echo ---------------------- Restart Service ------------------
sudo systemctl daemon-reload


echo ------------------------- Start Mongo ----------------------
sudo systemctl start mongod

echo ------------------Enable Mongod Service---------------
sudo systemctl enable mongod.service

echo ------------------------- Get Mongo Status -----------------
sudo systemctl status mongod
