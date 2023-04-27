# frozen_string_literal: true

module HtmlTableDSL
  class Table
    def initialize(options)
      @options = options
      @rows = []
      @header = []
    end

    def header(options = {}, &block)
      row = Row.new(options)
      row.instance_eval(&block) if block_given?
      @header << row
    end

    def row(options = {}, &block)
      row = Row.new(options)
      row.instance_eval(&block) if block_given?
      @rows << row
    end

    def to_html
      html = "<table#{attributes_to_html(@options)}>"
      html += "<thead#{attributes_to_html(header_options)}><tr>#{header_cells_html}</tr></thead>" unless @header.empty?
      html += "<tbody>#{body_rows_html}</tbody>" unless @rows.empty?
      html += "</table>"
      html
    end

    private

    def attributes_to_html(options)
      options.map { |key, value| " #{key}='#{value}'" }.join("")
    end

    def header_options
      @header.first.instance_variable_get("@options")
    end

    def header_cells_html
      @header.first.cells.map { |cell| cell_html(cell, tag: "th") }.join
    end

    def body_rows_html
      @rows.map { |row| "<tr#{attributes_to_html(row.instance_variable_get("@options"))}>#{row_cells_html(row)}</tr>" }
           .join
    end

    def row_cells_html(row)
      row.cells.map { |cell| cell_html(cell, tag: "td") }.join
    end

    def cell_html(cell, tag:)
      attributes = []
      attributes << " class='#{cell[:class]}'" if cell[:class]
      attributes << " style='#{cell[:style]}'" if cell[:style]
      attributes = attributes.join("")

      "<#{tag}#{attributes}>#{cell[:value]}</#{tag}>"
    end
  end
end
