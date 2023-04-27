# frozen_string_literal: true

require_relative "../services/validator"

module HtmlTableDSL
  class Row
    include Validator

    attr_reader :cells

    def initialize(options)
      validate_options options

      @options = options
      @cells = []
    end

    def cell(value, options = {})
      @cells << { value: value, class: options[:class], style: options[:style] }
    end
  end
end
