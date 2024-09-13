#!/bin/bash
set -e

# Check if Docker is installed and accessible
if ! command -v docker &> /dev/null; then
  echo "Docker is not installed or not in the system's PATH."
  exit 1
fi

echo "Stopping the first running container..."

# List running containers for debugging
echo "Currently running containers:"
docker ps

# Get the ID of the first running container
containerid=$(docker ps -q | head -n 1)

if [ -z "$containerid" ]; then
  echo "No running container found. Exiting."
else
  echo "Container ID found: $containerid. Stopping the container..."
  
  # Try stopping the container, with error handling
  if docker rm -f $containerid; then
    echo "Container stopped successfully."
  else
    echo "Failed to stop the container. Check permissions or container status."
    exit 1
  fi
fi
