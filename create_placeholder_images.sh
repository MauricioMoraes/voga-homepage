#!/bin/bash

# Create directory if it doesn't exist
mkdir -p assets/images/posts

# Create placeholder images for blog posts
# Use ImageMagick to create simple placeholder images with text

# Automação jurídica: blue background
convert -size 800x500 xc:#2980b9 \
  -fill white -gravity center -pointsize 48 \
  -annotate 0 "Automação Jurídica" \
  assets/images/posts/automacao-juridica.jpg

# Inteligência artificial: purple background
convert -size 800x500 xc:#8e44ad \
  -fill white -gravity center -pointsize 40 \
  -annotate 0 "Inteligência Artificial\nno Direito" \
  assets/images/posts/inteligencia-artificial-direito.jpg

# Gestão de escritório: green background
convert -size 800x500 xc:#27ae60 \
  -fill white -gravity center -pointsize 40 \
  -annotate 0 "Gestão de Escritório\nde Advocacia" \
  assets/images/posts/gestao-escritorio-advocacia.jpg

# Prazos processuais: red background
convert -size 800x500 xc:#c0392b \
  -fill white -gravity center -pointsize 48 \
  -annotate 0 "Prazos Processuais" \
  assets/images/posts/prazos-processuais.jpg

echo "Placeholder images created successfully!"