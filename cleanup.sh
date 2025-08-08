#!/bin/bash

# Emergency cleanup script for vhost-lab containers

echo "🧹 Emergency cleanup for vhost-lab containers..."

# Stop and remove vhost-lab containers
docker stop vhost-lab-container 2>/dev/null || true
docker rm vhost-lab-container 2>/dev/null || true

# Also check for any containers using vhost-lab image
docker ps -a --filter ancestor=vhost-lab --format "{{.ID}}" | xargs -r docker stop 2>/dev/null || true
docker ps -a --filter ancestor=vhost-lab --format "{{.ID}}" | xargs -r docker rm 2>/dev/null || true

echo "✅ Cleanup completed!"
echo ""
echo "Remaining containers:"
docker ps
