#!/bin/bash
set -e

# Stop the running container (if any)
echo "Stopping the first running container..."
containerid=$(docker ps -q | head -n 1)
docker rm -f $containerid 
