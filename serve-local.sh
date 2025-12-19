#!/bin/bash

# Local Jekyll Server Script (Docker-based)
# This script uses Docker so you don't need Ruby installed locally

echo "🐳 Starting Jekyll server via Docker..."
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Error: Docker is not running"
    echo "Please start Docker Desktop and try again"
    exit 1
fi

echo "📦 Preparing Docker container..."
echo ""
echo "🚀 Building and serving site..."
echo "📍 Site will be available at: http://localhost:4000/"
echo "⚠️  Press Ctrl+C to stop"
echo ""
echo "Note: First run may take a few minutes to install dependencies..."
echo ""

# Run Jekyll server in Docker (with platform flag for Apple Silicon)
docker run --rm \
  --platform linux/amd64 \
  --name jekyll-server \
  -p 4000:4000 \
  -v "$(pwd):/srv/jekyll" \
  -e JEKYLL_ENV=development \
  jekyll/jekyll:4.2.2 \
  bash -c "cd /srv/jekyll/.jekyll && bundle install && bundle exec jekyll serve --source /srv/jekyll --config /srv/jekyll/.jekyll/_config.yml --baseurl '' --host 0.0.0.0 --force_polling --trace"
