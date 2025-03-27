#!/bin/bash
echo "Installing dependencies..."
sudo chown -R ec2-user:ec2-user /home/ec2-user/nextjs-app
cd /home/ec2-user/nextjs-app
npm install
npm install pm2 -g
