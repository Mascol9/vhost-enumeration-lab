#!/bin/bash

# VHost Lab - Simple Start Script

echo "🧪 VHost Enumeration Lab"
echo "========================"
echo ""
echo "Building and starting lab..."
echo "Press Ctrl+C to stop the lab"
echo ""

# Build the image
docker build -t vhost-lab . || exit 1

# Cleanup any existing containers
docker rm -f vhost-lab-container 2>/dev/null || true

# Find available port starting from 13100
PORT=13100
while lsof -i :$PORT >/dev/null 2>&1; do
    echo "Port $PORT is in use, trying next port..."
    PORT=$((PORT + 1))
done

echo "Found available port: $PORT"

# Start the container in foreground
echo "Starting lab on http://localhost:$PORT"
echo "Test with: curl -H 'Host: admin.test.local' http://localhost:$PORT/"
echo ""
echo "Lab is running... (Ctrl+C to stop)"

# Trap for cleanup when Ctrl+C is pressed
trap 'echo ""; echo "Stopping lab..."; docker stop vhost-lab-container; docker rm vhost-lab-container; echo "Lab stopped."; exit 0' INT

# Start the container and follow logs
docker run --rm --name vhost-lab-container -p $PORT:80 vhost-lab

