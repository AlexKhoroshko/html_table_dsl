# frozen_string_literal: true

require_relative "html_table_dsl/classes/row"
require_relative "html_table_dsl/classes/table"
require_relative "html_table_dsl/services/validator"
require_relative "html_table_dsl/version"

module HtmlTableDSL
  include Validator

  def table(options = {}, &block)
    validate_table options

    table = Table.new(options)
    table.instance_eval(&block) if block_given?
    table.to_html
  end
end
