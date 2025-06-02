#!/usr/bin/env ruby
require 'fileutils'

# Directory where we'll store our cleaned markdown files
FileUtils.mkdir_p('docs/cleaned_articles')

# Function to extract article content from Migalhas HTML
def extract_migalhas_content(file_path)
  content = File.read(file_path)
  
  # Extract title
  title_match = content.match(/<title>(.*?)<\/title>/)
  title = title_match ? title_match[1].gsub(' - Migalhas', '').strip : "Unknown Title"
  
  # Extract article content
  article_start = content.index('<div class="article-content">')
  article_end = content.index('<div class="article-footer">', article_start) if article_start
  
  if article_start && article_end
    # Extract the article HTML
    article_html = content[article_start...article_end]
    
    # Clean up HTML
    clean_content = clean_html(article_html)
    
    # Get author info if available
    author_match = content.match(/<div class="article-author">(.*?)<\/div>/m)
    author_info = author_match ? extract_text_from_html(author_match[1]) : nil
    
    # Get publication date if available
    date_match = content.match(/<div class="article-date">(.*?)<\/div>/m)
    pub_date = date_match ? extract_text_from_html(date_match[1]) : nil
    
    return {
      title: title,
      content: clean_content,
      author: author_info,
      date: pub_date
    }
  else
    puts "Could not find article content in #{file_path}"
    return nil
  end
end

# Function to extract article content from Conjur HTML
def extract_conjur_content(file_path)
  content = File.read(file_path)
  
  # Extract title
  title_match = content.match(/<title>(.*?)<\/title>/)
  title = title_match ? title_match[1].gsub(' — Consultor Jurídico', '').strip : "Unknown Title"
  
  # Extract article content
  article_start = content.index('<div class="entry-content">')
  article_end = content.index('<div class="entry-footer">', article_start) if article_start
  
  if article_start && article_end
    # Extract the article HTML
    article_html = content[article_start...article_end]
    
    # Clean up HTML
    clean_content = clean_html(article_html)
    
    # Get author info if available
    author_match = content.match(/<span class="author">(.*?)<\/span>/m)
    author_info = author_match ? extract_text_from_html(author_match[1]) : nil
    
    # Get publication date if available
    date_match = content.match(/<time datetime="(.*?)">/m)
    pub_date = date_match ? date_match[1] : nil
    
    return {
      title: title,
      content: clean_content,
      author: author_info,
      date: pub_date
    }
  else
    puts "Could not find article content in #{file_path}"
    return nil
  end
end

# Function to clean HTML and convert to markdown-like text
def clean_html(html)
  return "" if html.nil? || html.empty?
  
  # Replace HTML elements with markdown equivalents
  text = html.dup
  
  # Replace headings
  text.gsub!(/<h1.*?>(.*?)<\/h1>/im, "\n# \\1\n")
  text.gsub!(/<h2.*?>(.*?)<\/h2>/im, "\n## \\1\n")
  text.gsub!(/<h3.*?>(.*?)<\/h3>/im, "\n### \\1\n")
  text.gsub!(/<h4.*?>(.*?)<\/h4>/im, "\n#### \\1\n")
  
  # Replace paragraphs
  text.gsub!(/<p.*?>(.*?)<\/p>/im, "\n\\1\n")
  
  # Replace links
  text.gsub!(/<a.*?href="(.*?)".*?>(.*?)<\/a>/im, "[\\2](\\1)")
  
  # Replace lists
  text.gsub!(/<li.*?>(.*?)<\/li>/im, "* \\1\n")
  text.gsub!(/<ul.*?>/im, "\n")
  text.gsub!(/<\/ul>/im, "\n")
  text.gsub!(/<ol.*?>/im, "\n")
  text.gsub!(/<\/ol>/im, "\n")
  
  # Replace bold/strong
  text.gsub!(/<(b|strong).*?>(.*?)<\/(b|strong)>/im, "**\\2**")
  
  # Replace italic/emphasis
  text.gsub!(/<(i|em).*?>(.*?)<\/(i|em)>/im, "*\\2*")
  
  # Remove other HTML tags
  text.gsub!(/<.*?>/m, "")
  
  # Decode HTML entities
  text.gsub!(/&nbsp;/, " ")
  text.gsub!(/&amp;/, "&")
  text.gsub!(/&lt;/, "<")
  text.gsub!(/&gt;/, ">")
  text.gsub!(/&quot;/, "\"")
  text.gsub!(/&#39;/, "'")
  
  # Clean up whitespace
  text.gsub!(/\n\s*\n\s*\n/, "\n\n")
  text.gsub!(/\A\s+/, "")
  text.gsub!(/\s+\z/, "")
  
  return text
end

# Function to extract plain text from HTML
def extract_text_from_html(html)
  return html.gsub(/<.*?>/, "").strip
end

# Process each article file
Dir.glob("docs/articles/*.md").each do |file|
  puts "Processing #{file}..."
  
  # Read the file header
  header = File.readlines(file).first(3).join
  
  # Get title and URL
  title_match = header.match(/# (.*?)\n/)
  url_match = header.match(/\[(.*?)\]\((.*?)\)/)
  
  title = title_match ? title_match[1] : nil
  url = url_match ? url_match[2] : nil
  
  next unless title && url
  
  # Determine which extractor to use based on the URL
  article_data = if url.include?("migalhas.com.br")
    extract_migalhas_content(file)
  elsif url.include?("conjur.com.br")
    extract_conjur_content(file)
  else
    puts "Unknown source for #{file}, skipping..."
    next
  end
  
  next unless article_data
  
  # Create a new markdown file with extracted content
  output_file = "docs/cleaned_articles/#{File.basename(file)}"
  
  File.open(output_file, "w") do |f|
    f.puts "# #{article_data[:title]}"
    f.puts
    f.puts "Fonte original: [#{url}](#{url})"
    f.puts
    if article_data[:author]
      f.puts "Autor original: #{article_data[:author]}"
      f.puts
    end
    if article_data[:date]
      f.puts "Data de publicação original: #{article_data[:date]}"
      f.puts
    end
    f.puts article_data[:content]
  end
  
  puts "✅ Extracted and saved to #{output_file}"
end

puts "Done processing articles!"