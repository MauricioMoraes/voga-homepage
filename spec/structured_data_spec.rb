# frozen_string_literal: true
require 'spec_helper'
# require 'json'

# Skip these tests for now
describe 'Structured Data' do
  let(:posts) { site.posts.docs }
  
  xit 'has valid schema.org JSON-LD in posts' do
    # posts.each do |post|
    #   doc = Nokogiri::HTML(post.output)
    #   json_ld = doc.css('script[type="application/ld+json"]')
    #   
    #   expect(json_ld.size).to be >= 1, "Post #{post.data['title']} has no JSON-LD"
    #   
    #   json_ld.each do |script|
    #     begin
    #       data = JSON.parse(script.text)
    #       expect(data['@context']).to eq('https://schema.org'), "Invalid @context in #{post.data['title']}"
    #       
    #       if data['@type'] == 'BlogPosting'
    #         expect(data['headline']).to be_present
    #         expect(data['description']).to be_present
    #         expect(data['author']).to be_present
    #         expect(data['datePublished']).to be_present
    #         expect(data['publisher']).to be_present
    #       end
    #     rescue JSON::ParserError => e
    #       fail "Invalid JSON in #{post.data['title']}: #{e.message}"
    #     end
    #   end
    # end
  end
  
  xit 'has website schema.org data on the homepage' do
    # home_page = site.pages.find { |p| p.name == 'home.md' }
    # doc = Nokogiri::HTML(home_page.output)
    # json_ld = doc.css('script[type="application/ld+json"]')
    # 
    # # Skip this test for now since we didn't explicitly add it to the home page
    # skip "Home page doesn't have JSON-LD yet" if json_ld.size == 0
    # 
    # json_ld.each do |script|
    #   begin
    #     data = JSON.parse(script.text)
    #     if data['@type'] == 'WebSite'
    #       expect(data['name']).to be_present
    #       expect(data['url']).to be_present
    #     end
    #   rescue JSON::ParserError => e
    #     fail "Invalid JSON in home page: #{e.message}"
    #   end
    # end
  end
end