# frozen_string_literal: true

module HtmlTableDSL
  class Tag
    attr_reader :name, :attributes, :children

    def initialize(name, attributes = {}, &block)
      @name = name
      @attributes = attributes
      @children = []

      instance_eval(&block) if block_given?
    end

    def add_child(tag)
      @children << tag
    end

    def to_html
      "<#{@name}#{attributes_html}>#{children_html}</#{@name}>"
    end

    private

    def attributes_html
      @attributes.map { |key, value| " #{key}='#{value}'" }.join("")
    end

    def children_html
      @children.map { |child| child.is_a?(Tag) ? child.to_html : child }.join
    end
  end
end
