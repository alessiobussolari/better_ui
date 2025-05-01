module BetterUi
  module ApplicationHelper
    # Render markdown
    def better_ui_markdown(text)
      return '' if text.blank?
      
      renderer = Redcarpet::Render::HTML.new(
        filter_html: false,
        hard_wrap: true,
        link_attributes: { target: '_blank', rel: 'noopener noreferrer' }
      )
      
      markdown = Redcarpet::Markdown.new(
        renderer,
        autolink: true,
        tables: true,
        fenced_code_blocks: true,
        strikethrough: true,
        superscript: true,
        underline: true,
        highlight: true,
        quote: true,
        footnotes: true
      )
      
      rendered_html = markdown.render(text).html_safe
      
      # Applica classi Tailwind agli elementi HTML generati dal markdown
      rendered_html
        .gsub(/<h1>/i, '<h1 class="text-3xl font-bold mb-6 pb-2 border-b border-gray-200">')
        .gsub(/<h2>/i, '<h2 class="text-2xl font-semibold mt-8 mb-4 pb-2 border-b border-gray-100">')
        .gsub(/<h3>/i, '<h3 class="text-xl font-medium mt-6 mb-3">')
        .gsub(/<pre>/i, '<pre class="bg-gray-100 p-4 rounded-md overflow-x-auto my-4">')
        .gsub(/<code>/i, '<code class="font-mono">')
        .gsub(/<ul>/i, '<ul class="ml-6 mb-4">')
        .gsub(/<ol>/i, '<ol class="ml-6 mb-4">')
        .gsub(/<p>/i, '<p class="mb-4 leading-relaxed">')
        .gsub(/<a /i, '<a class="text-blue-600 no-underline hover:underline" ')
        .gsub(/<blockquote>/i, '<blockquote class="border-l-4 border-gray-200 pl-4 ml-0 text-gray-600">')
        .html_safe
    end
    
    # Determina se il path corrente corrisponde a quello dato
    def current_page?(path)
      request.path == path
    end
  end
end 