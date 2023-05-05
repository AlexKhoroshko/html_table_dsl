# frozen_string_literal: true

require_relative "tag"

module HtmlTableDSL
  class Table < Tag
    def initialize(options = {}, &block)
      super("table", options, &block)
    end

    def header(options = {}, &block)
      add_child(Container.new("thead", options, &block))
    end

    def body(options = {}, &block)
      add_child(Container.new("tbody", options, &block))
    end

    def row(options = {}, &block)
      add_child(Row.new(options, &block))
    end
  end
end
