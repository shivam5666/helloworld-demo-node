#!/bin/bash

# Define the URL of the application (with the correct IP and port)
APP_URL="http://13.126.195.249:8080"

# Send a request to the app and capture the HTTP status code
HTTP_STATUS=$(curl --write-out "%{http_code}" --silent --output /dev/null "$APP_URL")

# Check if the status code is 200 (OK)
if [ "$HTTP_STATUS" -eq 200 ]; then
  echo "Application is running successfully! (Status: 200)"
  exit 0
else
  echo "Application is not running correctly. HTTP Status: $HTTP_STATUS"
  exit 1
fi

