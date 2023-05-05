# frozen_string_literal: true

require_relative "tag"

module HtmlTableDSL
  class Header < Tag
    def initialize(options = {}, &block)
      super("thead", options, &block)
    end

    def row(options = {}, &block)
      add_child(Row.new(options, &block))
    end
  end
end
