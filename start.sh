#!/bin/bash

# VHost Lab - Simple Start Script

echo "🧪 VHost Enumeration Lab"
echo "========================"
echo ""
echo "Building and starting lab..."
echo "Press Ctrl+C to stop the lab"
echo ""

# Function to cleanup containers
cleanup() {
    echo ""
    echo "Stopping lab..."
    docker stop vhost-lab-container 2>/dev/null
    docker rm vhost-lab-container 2>/dev/null
    echo "Lab stopped."
    exit 0
}

# Set trap for cleanup when interrupted
trap cleanup INT TERM

# Build the image
docker build -t vhost-lab . || exit 1

# Cleanup any existing containers
docker stop vhost-lab-container 2>/dev/null || true
docker rm vhost-lab-container 2>/dev/null || true

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

# Start the container and follow logs
docker run --rm --name vhost-lab-container -p $PORT:80 vhost-lab

# If we get here, the container stopped normally
cleanup

