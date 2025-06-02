# frozen_string_literal: true
require 'spec_helper'
require 'support/blank_present'

describe 'Authors' do
  let(:authors) { site.collections['authors'].docs }
  
  it 'has at least one author' do
    expect(authors.length).to be >= 1
  end
  
  it 'has all required author fields' do
    required_fields = %w[name display_name bio]
    
    authors.each do |author|
      required_fields.each do |field|
        expect(author.data[field]).to be_present, "Author #{author.data['name']} is missing #{field}"
      end
    end
  end
  
  it 'has author names that match filenames' do
    authors.each do |author|
      filename = File.basename(author.path, '.*')
      expect(author.data['name']).to eq(filename), 
        "Author #{author.data['name']} doesn't match filename #{filename}"
    end
  end
end