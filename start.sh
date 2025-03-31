#!/bin/bash

# Build and start the services
docker-compose up --build -d

# Wait for services to be ready
echo "Waiting for services to be ready..."
sleep 10

# Check if services are running
docker-compose ps

echo "Services are up and running!"
echo "Qdrant UI is available at: http://localhost:6333/dashboard"
echo "MCP Server is available SSE at: http://localhost:8000/sse"
echo "To view logs: docker-compose logs -f"
echo "To stop services: docker-compose down" 