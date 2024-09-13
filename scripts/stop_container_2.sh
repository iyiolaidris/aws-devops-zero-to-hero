#!/bin/bash
set -e

# Stop the running container (if any)
containerid=$(docker ps -q)  # This captures the container ID(s)
if [ -n "$containerid" ]; then
    docker rm -f $containerid  # Removes the running container
else
    echo "No running container found."
fi
