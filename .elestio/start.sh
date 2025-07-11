#!/bin/bash
set -e

# Start services
echo "Starting services..."
docker compose -f docker-compose.prod.yaml up -d

echo "Services started successfully!"
