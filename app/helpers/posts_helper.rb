module PostsHelper
  def content_preview(content, length: 100)
    return if content.blank?
    content[0..length].html_safe
  end
end
