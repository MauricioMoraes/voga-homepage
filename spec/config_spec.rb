# frozen_string_literal: true
require 'spec_helper'

describe 'Jekyll configuration' do
  it 'has the correct site title' do
    expect(site.config['title']).to eq('E-Dossie')
  end

  it 'has the correct locale' do
    expect(site.config['locale']).to eq('pt_BR')
  end

  it 'has the required plugins' do
    required_plugins = %w[jekyll-feed jekyll-sitemap jekyll-paginate jekyll-seo-tag]
    expect(site.config['plugins']).to include(*required_plugins)
  end
end