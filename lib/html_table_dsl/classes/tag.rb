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
      attributes_html = @attributes.map { |key, value| " #{key}='#{value}'" }.join("")
      children_html = @children.map do |child|
        if child.class == String
          child
        else
          child.to_html
        end
      end.join

      if children_html.empty?
        "<#{@name}#{attributes_html}></#{@name}>"
      else
        "<#{@name}#{attributes_html}>#{children_html}</#{@name}>"
      end
    end
  end
end
