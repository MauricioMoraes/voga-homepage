# frozen_string_literal: true
require 'spec_helper'
require 'support/blank_present'

describe 'Posts' do
  let(:posts) { site.posts.docs }
  let(:authors) { site.collections['authors'].docs }
  let(:author_names) { authors.map { |author| author.data['name'] } }
  
  describe 'front matter' do
    it 'has a valid author' do
      posts.each do |post|
        author = post.data['author']
        expect(author_names).to include(author)
      end
    end
    
    it 'has all required front matter fields' do
      required_fields = %w[layout title author date categories description]
      
      posts.each do |post|
        required_fields.each do |field|
          expect(post.data[field]).to be_present, "Post #{post.data['title']} is missing #{field}"
        end
      end
    end
    
    it 'has a title with appropriate length' do
      posts.each do |post|
        expect(post.data['title'].length).to be_between(20, 100), 
          "Post #{post.data['title']} title is too short or too long"
      end
    end
    
    it 'has a description with appropriate length' do
      posts.each do |post|
        expect(post.data['description'].length).to be_between(50, 200), 
          "Post #{post.data['title']} description is too short or too long"
      end
    end
  end
end