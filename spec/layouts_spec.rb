# frozen_string_literal: true
require 'spec_helper'

describe 'Layouts and Includes' do
  it 'has all required layouts' do
    layout_files = Dir.glob(File.join(File.expand_path('../_layouts', __dir__), '*.html'))
    required_layouts = %w[default home post page blog author]
    
    required_layouts.each do |layout|
      expect(layout_files).to include(File.expand_path("../_layouts/#{layout}.html", __dir__))
    end
  end
  
  it 'has all required includes' do
    include_files = Dir.glob(File.join(File.expand_path('../_includes', __dir__), '*.html'))
    required_includes = %w[navigation footer seo]
    
    required_includes.each do |include|
      expect(include_files).to include(File.expand_path("../_includes/#{include}.html", __dir__))
    end
  end
end