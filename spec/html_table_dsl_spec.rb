# frozen_string_literal: true

require "spec_helper"
require_relative "../lib/html_table_dsl"

class HtmlTableTest
  include HtmlTableDSL
end

# rubocop:disable Metrics/BlockLength

RSpec.describe HtmlTableTest do
  describe "#table" do
    context "with valid options" do
      let(:empty_table_html) { "<table></table>" }
      let(:styled_empty_table_html) { "<table class='my-table' style='color: red;'></table>" }
      let(:table_with_rows_and_header_html) do
        "<table>"\
        "<tr><th>Header 1</th><th>Header 2</th></tr>"\
        "<tr><td>Row 1 Cell 1</td><td>Row 1 Cell 2</td></tr>"\
        "<tr><td>Row 2 Cell 1</td><td>Row 2 Cell 2</td></tr></table>"
      end
      let(:table_with_thead_and_tbody_html) do
        "<table>"\
        "<thead><tr><th>Header 1</th><th>Header 2</th></tr></thead>"\
        "<tbody><tr><td>Row 1 Cell 1</td><td>Row 1 Cell 2</td></tr>"\
        "<tr><td>Row 2 Cell 1</td><td>Row 2 Cell 2</td></tr></tbody></table>"
      end
      let(:styled_table_with_rows_and_header_html) do
        "<table class='my-table' style='color: red;'>"\
        "<thead><tr><th class='header-cell' style='text-align: center;'>Header 1</th>"\
        "<th class='header-cell' style='text-align: center;'>Header 2</th></tr></thead>"\
        "<tbody><tr class='even-row'><td>Row 1 Cell 1</td><td style='color: blue;'>Row 1 Cell 2</td></tr>"\
        "<tr class='odd-row'><td>Row 2 Cell 1</td><td style='color: green;'>Row 2 Cell 2</td></tr></tbody></table>"
      end

      it "returns a html table without data" do
        expect(subject.table).to eq(empty_table_html)
      end

      it "returns styled html table without data" do
        expect(subject.table(class: "my-table", style: "color: red;")).to eq(styled_empty_table_html)
      end

      it "returns a valid html table with thead and tbody tags" do
        html = subject.table do
          header do
            row do
              header_cell "Header 1"
              header_cell "Header 2"
            end
          end
          body do
            row do
              cell "Row 1 Cell 1"
              cell "Row 1 Cell 2"
            end
            row do
              cell "Row 2 Cell 1"
              cell "Row 2 Cell 2"
            end
          end
        end

        expect(html).to eq(table_with_thead_and_tbody_html)
      end

      it "returns a valid html table with header and rows" do
        html = subject.table do
          row do
            header_cell "Header 1"
            header_cell "Header 2"
          end
          row do
            cell "Row 1 Cell 1"
            cell "Row 1 Cell 2"
          end
          row do
            cell "Row 2 Cell 1"
            cell "Row 2 Cell 2"
          end
        end

        expect(html).to eq(table_with_rows_and_header_html)
      end

      it "returns a valid html table with styles and classes" do
        html = subject.table(class: "my-table", style: "color: red;") do
          header do
            row do
              header_cell "Header 1", class: "header-cell", style: "text-align: center;"
              header_cell "Header 2", class: "header-cell", style: "text-align: center;"
            end
          end
          body do
            row(class: "even-row") do
              cell "Row 1 Cell 1"
              cell "Row 1 Cell 2", style: "color: blue;"
            end
            row(class: "odd-row") do
              cell "Row 2 Cell 1"
              cell "Row 2 Cell 2", style: "color: green;"
            end
          end
        end

        expect(html).to eq(styled_table_with_rows_and_header_html)
      end
    end

    context "with invalid options" do
      let(:html) do
        subject.table(class: "my-table", style: "color: red;") do
          header do
            cell "Header 1", class: 123, style: "text-align: center;"
            cell "Header 2", class: "header-cell", style: 123
          end
          row(class: 123) do
            cell "Row 1 Cell 1"
            cell "Row 1 Cell 2", style: "color: blue;"
          end
          row(class: "odd-row") do
            cell "Row 2 Cell 1"
            cell "Row 2 Cell 2", style: "color: green;"
          end
        end
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
