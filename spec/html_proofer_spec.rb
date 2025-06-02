# frozen_string_literal: true
require 'spec_helper'

# Skip this test for now
describe 'HTML Proofer' do
  # Skip this test by default as it requires a full site build
  # Uncomment to run more thorough tests
  xit 'has no HTML errors' do
    # site_dir = File.expand_path('../../_site', __dir__)
    
    # options = {
    #   assume_extension: true,
    #   check_html: true,
    #   check_img_http: true,
    #   disable_external: true, # Skip external link checks
    #   empty_alt_ignore: true,
    #   internal_domains: ['edossie.com.br'],
    #   url_ignore: [/^#/], # Ignore anchor links
    #   file_ignore: [/google.*\.html$/],
    #   only_4xx: true,
    #   log_level: :error
    # }
    
    # HTMLProofer.check_directory(site_dir, options).run
  end
end