# frozen_string_literal: true

require_relative "tag"

module HtmlTableDSL
  class Row < Tag
    def initialize(options = {}, &block)
      super("tr", options, &block)
    end

    def cell(value = nil, options = {}, &block)
      add_child(Cell.new("td", value, options, &block))
    end

    def header_cell(value = nil, options = {}, &block)
      add_child(Cell.new("th", value, options, &block))
    end
  end
end
