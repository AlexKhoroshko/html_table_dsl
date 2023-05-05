# frozen_string_literal: true

require_relative "tag"

module HtmlTableDSL
  class Cell < Tag
    def initialize(tag_name, value, options = {})
      super(tag_name, options)
      @children << value.to_s
    end
  end
end
