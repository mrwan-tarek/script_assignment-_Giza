#!/bin/bash

# Stoping the container
docker stop task_tracker_cont

# Wait for 1 minute
echo "Waiting for 1 minute..."
sleep 60
echo "1 minute has passed. Resuming the script."

# Starting the container
docker start task_tracker_cont