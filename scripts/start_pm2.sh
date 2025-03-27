#!/bin/bash
echo "Starting Next.js application with PM2..."
# Ensure NVM is loaded
export NVM_DIR="/home/ec2-user/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Ensure pm2 is installed (in case it's not)
which pm2 || { echo "pm2 not found, installing..."; npm install -g pm2; }

# Start the application using pm2
echo "Starting Next.js application with PM2..."

cd /home/ec2-user/nextjs-app

# Stop previous process
pm2 stop "next-app"

# Start application
pm2 start app.js --name=next-app
