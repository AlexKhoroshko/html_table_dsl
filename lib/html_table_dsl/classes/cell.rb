# frozen_string_literal: true

require_relative "tag"

module HtmlTableDSL
  class Cell < Tag
    def initialize(value, options = {})
      super("td", options)
      @children << value.to_s
    end
  end
end
