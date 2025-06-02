# frozen_string_literal: true

class Site
  attr_reader :site

  def initialize
    @site = build_site
  end

  def build_site
    site = Jekyll::Site.new(Jekyll.configuration(
      source: File.expand_path('../..', __dir__),
      destination: File.expand_path('../../_site', __dir__)
    ))
    # Just load the configuration and data
    site.reset
    site.read
    # Don't process/render to avoid SCSS issues
    # site.process
    site
  end

  def posts
    @site.posts
  end

  def pages
    @site.pages
  end

  def collections
    @site.collections
  end

  def config
    @site.config
  end
end