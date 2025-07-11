#!/bin/bash
set -e

# Load pre-built Docker images if they exist
echo "Checking for pre-built Docker images..."
if [ -f /tmp/docker-images/unstract-images.tar ]; then
    echo "Loading pre-built Docker images..."
    docker load -i /tmp/docker-images/unstract-images.tar
fi

# Start services
echo "Starting services..."
docker-compose -f docker-compose.elestio.yaml up -d

# Wait for services to be ready
echo "Waiting for services to be ready..."
sleep 10

# Run database migrations
echo "Running database migrations..."
docker-compose -f docker-compose.elestio.yaml exec backend python manage.py migrate --noinput

echo "Services started successfully!"
