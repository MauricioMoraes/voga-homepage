#!/bin/bash

# E-Dossie Jekyll Starter Script
# This script provides a simple way to run the E-Dossie Jekyll site

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Error: Docker is not installed or not in PATH"
    echo "Please install Docker first: https://docs.docker.com/get-docker/"
    exit 1
fi

# Define colors for better readability
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting E-Dossie Jekyll Site${NC}"
echo -e "${YELLOW}Building Docker image...${NC}"

# Build the Docker image
docker build -t edossie-jekyll .

echo -e "${YELLOW}Starting Jekyll server...${NC}"

# Run the container
docker run --rm -it \
  -p 4000:4000 \
  -v "$(pwd):/app" \
  edossie-jekyll \
  bundle exec jekyll serve --host 0.0.0.0 --livereload

# This command will only run if the Docker container is stopped
echo -e "${GREEN}✅ Jekyll server has been stopped${NC}"