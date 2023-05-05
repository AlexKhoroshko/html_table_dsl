# frozen_string_literal: true

require_relative "html_table_dsl/classes/cell"
require_relative "html_table_dsl/classes/container"
require_relative "html_table_dsl/classes/row"
require_relative "html_table_dsl/classes/table"
require_relative "html_table_dsl/classes/tag"
require_relative "html_table_dsl/services/validator"
require_relative "html_table_dsl/version"

module HtmlTableDSL
  def table(options = {}, &block)
    table = Table.new(options)
    table.instance_eval(&block) if block_given?
    table.to_html
  end
end
