#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'fileutils'
require 'json'

# Try to load dotenv if available, but continue if not
begin
  require 'dotenv'
  Dotenv.load
rescue LoadError
  puts "Note: dotenv gem not found, continuing without it. Environment variables should be set manually."
end

# Create docs/articles directory if it doesn't exist
FileUtils.mkdir_p('docs/articles')

# List of Migalhas articles from objectives.md
articles = [
  {
    title: "Antecipação de precatórios: qual o melhor caminho?",
    url: "https://www.migalhas.com.br/depeso/415874/antecipacao-de-precatorios-qual-o-melhor-caminho"
  },
  {
    title: "Estratégias para otimizar a antecipação de crédito judicial",
    url: "https://www.migalhas.com.br/depeso/408702/estrategias-para-otimizar-a-antecipacao-de-credito-judicial"
  },
  {
    title: "O deságio na cessão de crédito judicial",
    url: "https://www.migalhas.com.br/depeso/405577/o-desagio-na-cessao-de-credito-judicial"
  },
  {
    title: "O preço é apenas a ponta do iceberg",
    url: "https://www.migalhas.com.br/depeso/387592/o-preco-e-apenas-a-ponta-do-iceberg"
  },
  {
    title: "Necessidade de regulamentação para mercado de ativos judiciais em 2024",
    url: "https://www.migalhas.com.br/depeso/413969/necessidade-de-regulamentacao-para-mercado-de-ativos-judiciais-em-2024"
  },
  {
    title: "Existe um valor mínimo para cessão de crédito judicial?",
    url: "https://www.migalhas.com.br/depeso/400191/existe-um-valor-minimo-para-cessao-de-credito-judicial"
  },
  {
    title: "Custo do empréstimo no Brasil é um dos mais elevados do mundo",
    url: "https://www.migalhas.com.br/depeso/396549/custo-do-emprestimo-no-brasil-e-um-dos-mais-elevados-do-mundo"
  },
  {
    title: "Quanto realmente vale seu crédito judicial?",
    url: "https://www.migalhas.com.br/depeso/393013/quanto-realmente-vale-seu-credito-judicial"
  },
  {
    title: "Possibilidade de antecipação parcial do crédito judicial",
    url: "https://www.migalhas.com.br/depeso/392259/possibilidade-de-antecipacao-parcial-do-credito-judicial"
  },
  {
    title: "Alterações legais sobre correção monetária e juros nos ativos judiciais",
    url: "https://www.conjur.com.br/2024-ago-29/impacto-das-alteracoes-legais-sobre-correcao-monetaria-e-juros-nos-ativos-judiciais/"
  },
  {
    title: "Mercado de créditos judiciais trouxe boas oportunidades para os advogados",
    url: "https://www.conjur.com.br/2022-mai-30/renata-nilsson-mercado-aquisicao-creditos-judiciais/"
  }
]

# Function to fetch article content
def fetch_article(url, title)
  # Create safe filename from title
  filename = title.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/-+/, '-').gsub(/^-|-$/, '')
  filepath = "docs/articles/#{filename}.md"
  
  puts "Fetching: #{title} from #{url}"
  
  # Use GEMINI API directly as the main approach
  if use_gemini_fallback(url, title, filepath)
    return true
  else
    puts "❌ Failed to fetch article with Gemini API. Trying direct HTTP request."
    
    begin
      # Try a simple direct request without parsing
      uri = URI(url)
      response = Net::HTTP.get_response(uri)
      
      if response.code == "200"
        # Save raw content as fallback
        File.open(filepath, 'w') do |file|
          file.puts "# #{title}\n\n"
          file.puts "Fonte: [#{url}](#{url})\n\n"
          file.puts "⚠️ Conteúdo em formato bruto - não foi possível extrair o texto formatado.\n\n"
          file.puts response.body.force_encoding('UTF-8').encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
        end
        
        puts "⚠️ Saved raw content to #{filepath}"
        return true
      else
        puts "❌ Failed to fetch article: HTTP Status #{response.code}"
      end
    rescue => e
      puts "❌ Error fetching article: #{e.message}"
    end
  end
  
  return false
end

# Function to use Google Gemini API as fallback
def use_gemini_fallback(url, title, filepath)
  api_key = ENV["GEMINI_API_KEY"]
  return false if api_key.nil? || api_key.empty?
  
  puts "Attempting to use Gemini API to summarize article content"
  
  begin
    uri = URI.parse("https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent")
    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"
    
    # Set query parameters
    params = { :key => api_key }
    uri.query = URI.encode_www_form(params)
    
    request.body = {
      "contents" => [
        {
          "parts" => [
            {
              "text" => "Visite este artigo: #{url} e extraia o conteúdo principal. Formate o texto em Markdown com quebras de linha e parágrafos preservados. Ignore propagandas, menus e elementos de navegação. Apenas extraia o conteúdo principal do artigo sobre ativos judiciais ou créditos judiciais."
            }
          ]
        }
      ]
    }.to_json
    
    # Send request
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
      http.request(request)
    end
    
    if response.code == "200"
      result = JSON.parse(response.body)
      content = result["candidates"][0]["content"]["parts"][0]["text"] rescue nil
      
      if content
        File.open(filepath, 'w') do |file|
          file.puts "# #{title}\n\n"
          file.puts "Fonte: [#{url}](#{url})\n\n"
          file.puts "Conteúdo gerado com auxílio de IA pois não foi possível extrair diretamente.\n\n"
          file.puts content
        end
        puts "✅ Saved to #{filepath} using Gemini API"
        return true
      end
    else
      puts "❌ Gemini API request failed: #{response.code} - #{response.body}"
    end
  rescue => e
    puts "❌ Error using Gemini API: #{e.message}"
  end
  
  return false
end

# Create a summary file with all article data
def create_summary(articles)
  summary = []
  
  articles.each do |article|
    title = article[:title]
    url = article[:url]
    
    # Create safe filename from title
    filename = title.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/-+/, '-').gsub(/^-|-$/, '')
    filepath = "docs/articles/#{filename}.md"
    
    if File.exist?(filepath)
      content = File.read(filepath)
      # Get first 300 characters of content for summary
      summary_text = content.split("\n\n")[2..4].join("\n\n")[0..300] + "..."
      
      summary << {
        title: title,
        url: url,
        file: filepath,
        summary: summary_text
      }
    end
  end
  
  # Write summary to file
  File.open('docs/articles/summary.json', 'w') do |file|
    file.puts JSON.pretty_generate(summary)
  end
  
  puts "✅ Created summary file at docs/articles/summary.json"
end

# Main execution
puts "🔍 Starting article fetch script..."
successes = 0

articles.each do |article|
  successes += 1 if fetch_article(article[:url], article[:title])
end

create_summary(articles)

puts "✨ Done! Successfully fetched #{successes} out of #{articles.length} articles."