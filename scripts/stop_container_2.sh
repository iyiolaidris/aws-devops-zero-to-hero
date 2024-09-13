#!/bin/bash
set -e

# Stop the running container (if any)
echo "Attempting to stop the first running container..."

# Get the ID of the first running container
containerid=$(docker ps -q | head -n 1)

if [ -z "$containerid" ]; then
  echo "No running container found. Exiting."
else
  echo "Container ID found: $containerid. Stopping the container..."
  docker rm -f $containerid
  echo "Container stopped successfully."
fi
