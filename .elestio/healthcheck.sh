#!/bin/bash
set -e

# Check if backend is running
if ! curl -f http://localhost:8000/health/; then
    echo "Backend health check failed"
    exit 1
fi

# Check if frontend is running
if ! curl -f http://localhost:3000; then
    echo "Frontend health check failed"
    exit 1
fi

echo "All services are healthy"
exit 0
