# frozen_string_literal: true

require_relative "tag"

module HtmlTableDSL
  class Cell < Tag
    def initialize(tag_name, value = nil, options = {}, &block)
      super(tag_name, options, &block)

      add_child(value.to_s)
    end
  end
end
