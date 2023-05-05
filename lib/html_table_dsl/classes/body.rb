# frozen_string_literal: true

require_relative "tag"

module HtmlTableDSL
  class Body < Tag
    def initialize(options = {}, &block)
      super("tbody", options, &block)
    end

    def row(options = {}, &block)
      add_child(Row.new(options, &block))
    end
  end
end
