#!/bin/bash

# Since we can't use curl directly, let's create sample images for demonstration

# Create directory if it doesn't exist
mkdir -p assets/images/posts

# Generate solid color images with text as placeholder for the real images
# We'll create 800x500 placeholder images

# Function to create a placeholder image with text
create_placeholder() {
  local filename=$1
  local title=$2
  local color=$3
  
  # Create a blank 800x500 colored image
  convert -size 800x500 "xc:$color" "assets/images/posts/$filename"
  
  # Add text to the image
  convert "assets/images/posts/$filename" -pointsize 40 -gravity center \
    -annotate 0 "$title" "assets/images/posts/$filename"
}

# Create placeholders for each blog post
create_placeholder "automacao-juridica.jpg" "Automação Jurídica" "#3498db"
create_placeholder "inteligencia-artificial-direito.jpg" "Inteligência Artificial no Direito" "#9b59b6"
create_placeholder "gestao-escritorio-advocacia.jpg" "Gestão de Escritório de Advocacia" "#2ecc71"
create_placeholder "prazos-processuais.jpg" "Prazos Processuais" "#e74c3c"

echo "Placeholder images created successfully!"