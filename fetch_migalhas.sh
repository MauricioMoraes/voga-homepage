#!/bin/bash

# Make sure script is executable
chmod +x fetch_articles.rb

# Run the fetch articles script through Docker Compose
docker-compose run --rm jekyll bundle exec ruby fetch_articles.rb

# Output completion message
echo "Articles fetched and saved to docs/articles directory"