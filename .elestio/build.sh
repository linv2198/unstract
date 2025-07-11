#!/bin/bash
set -e

# Install dependencies
echo "Installing system dependencies..."
apt-get update
apt-get install -y make build-essential python3-pip python3-venv

# Install Docker Compose if not already installed
if ! command -v docker-compose &> /dev/null; then
    echo "Installing Docker Compose..."
    pip3 install docker-compose
fi

# Build Docker images
echo "Building Docker images..."
docker-compose -f docker-compose.elestio.yaml build

# Save the images to a tarball for faster deployment
echo "Saving Docker images..."
mkdir -p /tmp/docker-images
docker save $(docker images -q) -o /tmp/docker-images/unstract-images.tar

echo "Build completed successfully!"
