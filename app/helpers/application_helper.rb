module ApplicationHelper
  def markdown_to_html(markdown_str)
    options = {
      :autolink => true,
      :space_after_headers => true,
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :hard_wrap => true,
      :strikethrough =>true
    }
    markdown_parser = Redcarpet::Markdown.new(HTMLwithCodeRay, options)
    markdown_parser.render(markdown_str).html_safe
  end

  class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(tab_width: 2)
    end
  end

  def org_to_html(org_str)
    Organismo::Document.new(org_str).to_html.html_safe
  end
end
