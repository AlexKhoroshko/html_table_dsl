# frozen_string_literal: true

require_relative "tag"

module HtmlTableDSL
  class Container < Tag
    def initialize(tag_name, options = {}, &block)
      super(tag_name, options, &block)
    end

    def row(options = {}, &block)
      add_child(Row.new(options, &block))
    end
  end
end
