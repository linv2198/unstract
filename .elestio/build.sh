#!/bin/bash
set -e

# Install dependencies
apt-get update
apt-get install -y make build-essential

# Build Docker images
echo "Building Docker images..."
docker compose -f docker-compose.prod.yaml build

echo "Build completed successfully!"
