#!/bin/bash
echo "Starting Next.js application with PM2..."
cd /home/ec2-user/nextjs-app

# Stop previous process
pm2 stop "next-app"

# Start application
pm2 start app.js --name=next-app
