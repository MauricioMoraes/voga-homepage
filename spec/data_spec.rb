# frozen_string_literal: true
require 'spec_helper'
require 'support/blank_present'

describe 'Data files' do
  let(:navigation) { site.site.data['navigation'] }
  let(:footer) { site.site.data['footer'] }
  
  describe 'navigation.yml' do
    it 'has navigation data' do
      expect(navigation).to be_present
    end
    
    it 'has at least one navigation item' do
      expect(navigation.length).to be > 0
    end
    
    it 'has required fields for each item' do
      navigation.each do |item|
        expect(item['name']).to be_present
        expect(item['link']).to be_present
      end
    end
  end
  
  describe 'footer.yml' do
    it 'has footer data' do
      expect(footer).to be_present
    end
    
    it 'has a copyright statement' do
      expect(footer['copyright']).to be_present
    end
    
    it 'has social links' do
      expect(footer['socials']).to be_present
      expect(footer['socials'].length).to be > 0
      
      footer['socials'].each do |social|
        expect(social['name']).to be_present
        expect(social['icon']).to be_present
        expect(social['link']).to be_present
      end
    end
    
    it 'has footer links' do
      expect(footer['links']).to be_present
      expect(footer['links'].length).to be > 0
      
      footer['links'].each do |section|
        expect(section['title']).to be_present
        expect(section['items']).to be_present
        expect(section['items'].length).to be > 0
        
        section['items'].each do |item|
          expect(item['name']).to be_present
          expect(item['link']).to be_present
        end
      end
    end
  end
end