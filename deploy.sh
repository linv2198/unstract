#!/bin/bash
set -e

# Load environment variables
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "Error: .env file not found. Please create one based on env.production"
    exit 1
fi

# Create necessary directories
mkdir -p ./certs
mkdir -p ./letsencrypt
mkdir -p ${TOOL_REGISTRY_CONFIG_SRC_PATH:-./tool_registry}

# Set proper permissions
chmod -R 755 ./nginx
chmod 644 ./nginx/nginx.conf

# Pull the latest images
echo "Pulling Docker images..."
docker compose -f docker-compose.prod.yaml pull

# Start the services in detached mode
echo "Starting services..."
docker compose -f docker-compose.prod.yaml up -d

echo ""
echo "============================================="
echo "Unstract is being deployed in production mode"
echo "============================================="
echo ""
echo "1. Services are starting in the background."
echo "2. To view logs, run: docker compose -f docker-compose.prod.yaml logs -f"
echo "3. To stop the services, run: docker compose -f docker-compose.prod.yaml down"
echo ""
echo "Note: Before going live, make sure to:"
echo "- Set up SSL certificates (e.g., using Let's Encrypt)"
echo "- Update DNS records to point to your server"
echo "- Configure your firewall to allow traffic on ports 80 and 443"
echo "- Set up proper backups for your database and volumes"
