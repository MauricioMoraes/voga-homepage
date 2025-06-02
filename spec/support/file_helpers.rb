# frozen_string_literal: true

module FileHelpers
  def site
    @site ||= Site.new
  end
end