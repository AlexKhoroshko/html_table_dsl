# frozen_string_literal: true

module HtmlTableDSL
  module Validator
    ALLOWED_TABLE_ATTRIBUTES = %i[class style width height border cellpadding header rows].freeze
    ALLOWED_TAG_ATTRIBUTES = %i[class style].freeze

    def validate_table(options)
      validate_allowed_options(ALLOWED_TABLE_ATTRIBUTES, options)
    end

    def validate_options(options)
      validate_allowed_options(ALLOWED_TAG_ATTRIBUTES, options)
      validate_type_of_options(options)
    end

    private

    def validate_type_of_options(options)
      return if options.empty? || options.values.all? { |value| value.is_a? String }

      raise StandardError, "Attribute value must be a string"
    end

    def validate_allowed_options(allowed_attributes, options)
      unknown_attributes = options.keys - allowed_attributes

      return if unknown_attributes.empty?

      raise StandardError, "Unknown attributes: #{unknown_attributes.join(", ")}"
    end
  end
end
