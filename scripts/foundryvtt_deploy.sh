#!/usr/bin/env bash
# https://foundryvtt.com/article/installation/
# https://foundryvtt.wiki/en/setup/linux-installation

# NodeJS
sudo apt install -y libssl-dev
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt install -y nodejs
# check
node --version
npm --version

# Foundry VTT deploy
# Create application and user data directories
cd $HOME
mkdir foundryvtt
mkdir foundrydata

# Install the software
cd foundryvtt
wget -O foundryvtt.zip "<foundry-website-download-url>"
unzip foundryvtt.zip

# IGNORE
#node resources/app/main.js --dataPath=$HOME/foundrydata

# pm2 /* LATER */
sudo npm install -g pm2
pm2 start $HOME/foundryvtt/resources/app/main.js -- --port=30000 --dataPath=/$HOME/foundrydata
pm2 save
pm2 startup systemd
