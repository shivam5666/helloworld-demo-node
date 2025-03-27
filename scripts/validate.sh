#!/bin/bash

# Define the URL of the application (with the correct IP and port)
APP_URL="http://13.126.195.249:8080"

# Define SNS Topic ARN (replace with your actual SNS topic ARN)
SNS_TOPIC_ARN="arn:aws:sns:ap-south-1:307946635035:nextjs-app"

# Send a request to the app and capture the HTTP status code
HTTP_STATUS=$(curl --write-out "%{http_code}" --silent --output /dev/null "$APP_URL")

# Check if the status code is 200 (OK)
if [ "$HTTP_STATUS" -eq 200 ]; then
  # Application is running successfully, send SNS notification
  echo "Application is running successfully! (Status: 200)"
  
  # Send success notification to SNS
  aws sns publish \
    --topic-arn "$SNS_TOPIC_ARN" \
    --message "The application is running successfully on $APP_URL. Status: 200" \
    --subject "Application Status: Success"
  
  exit 0
else
  # Application is not running correctly, send SNS notification
  echo "Application is not running correctly. HTTP Status: $HTTP_STATUS"
  
  # Send failure notification to SNS
  aws sns publish \
    --topic-arn "$SNS_TOPIC_ARN" \
    --message "The application is not running correctly on $APP_URL. HTTP Status: $HTTP_STATUS" \
    --subject "Application Status: Failure"
  
  exit 1
fi

