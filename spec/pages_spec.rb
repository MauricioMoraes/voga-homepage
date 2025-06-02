# frozen_string_literal: true
require 'spec_helper'

describe 'Pages' do
  let(:pages) { site.pages }
  
  describe 'homepage' do
    let(:home) { pages.find { |p| p.name == 'home.md' } }
    
    it 'exists' do
      expect(home).not_to be_nil
    end
    
    it 'has the correct layout' do
      expect(home.data['layout']).to eq('home')
    end
    
    it 'has the correct permalink' do
      expect(home.data['permalink']).to eq('/')
    end
  end
  
  describe 'required pages' do
    let(:page_filenames) { pages.map(&:name) }
    
    it 'has all required pages' do
      required_pages = ['blog.md', 'termos-de-uso.md', 'politica-de-privacidade.md']
      required_pages.each do |page|
        expect(page_filenames).to include(page)
      end
    end
  end
end