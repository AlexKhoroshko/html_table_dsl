# frozen_string_literal: true

require_relative "tag"

module HtmlTableDSL
  class Row < Tag
    def initialize(options = {}, &block)
      super("tr", options, &block)
    end

    def cell(value, options = {})
      add_child(Cell.new("td", value, options))
    end

    def header_cell(value, options = {})
      add_child(Cell.new("th", value, options))
    end
  end
end
