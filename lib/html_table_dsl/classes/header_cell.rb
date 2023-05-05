# frozen_string_literal: true

require_relative "tag"

module HtmlTableDSL
  class HeaderCell < Tag
    def initialize(value, options = {})
      super("th", options)
      @children << value.to_s
    end
  end
end
