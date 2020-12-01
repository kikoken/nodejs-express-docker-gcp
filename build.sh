#!/bin/bash
echo -e "Initial build task"
echo -e "------------------"

# create bundle app
npm run build

#Clean docker images if exists
docker rmi -f app-node:latest > /dev/null 2>&1 && echo 'removed images' || echo 'nothing to remove'
# Create docker images
docker build -t app-node .

echo -e "------------------"
echo -e "Task build finish"
echo -e "------------------"