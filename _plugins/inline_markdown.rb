require "redcarpet"
require 'pry'

module Jekyll
  class MarkdownBlock < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      content = super
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new,
        disable_indented_code_blocks: true,
        fenced_code_blocks: true)
      markdown.render(content)
    end
  end
end

Liquid::Template.register_tag('inline_markdown', Jekyll::MarkdownBlock)
