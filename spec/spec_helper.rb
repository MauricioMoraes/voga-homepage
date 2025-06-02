# Require all of the necessary gems
require 'rspec'
require 'jekyll'
require 'nokogiri'
# Commenting out html-proofer until we fix the issues
# require 'html-proofer'
require 'support/file_helpers'
require 'support/site'
require 'support/blank_present'

RSpec.configure do |config|
  config.include FileHelpers

  # rspec-expectations config
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = :random
  Kernel.srand config.seed
end