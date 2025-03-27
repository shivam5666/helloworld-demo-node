#!/bin/bash
echo "Installing dependencies..."
sudo chown -R ec2-user:ec2-user /home/ec2-user/nextjs-app

# Ensure NVM is loaded
export NVM_DIR="/home/ec2-user/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Check npm
which npm || { echo "npm not found"; exit 1; }
cd /home/ec2-user/nextjs-app
npm install
npm install pm2 -g
