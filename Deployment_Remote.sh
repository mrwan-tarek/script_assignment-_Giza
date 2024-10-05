#!/bin/bash

# Ensure the remote directory exists
ssh -i key.pem ec2-user@44.242.217.99 "mkdir -p /home/ec2-user/task-tracker"

# Transfer the project files to the remote VM
scp -i key.pem -r /home/mrwan/Desktop/Giza_Systems/task-tracker/code/* ec2-user@44.242.217.99:/home/ec2-user/task-tracker

echo "Code transferred successfully to 44.242.217.99."

# Build Docker image on the remote VM
ssh -i key.pem ec2-user@44.242.217.99 << EOF
  cd /home/ec2-user/task-tracker
  echo "Building Docker image..."
  docker build -t task_tracker_image .
  echo "Running Docker container..."
  docker run -d --name task_tracker_cont -p 80:8080 task_tracker_image
EOF

echo "Docker container runns successfully on 44.242.217.99."
