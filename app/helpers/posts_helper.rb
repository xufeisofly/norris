module PostsHelper
  def content_preview(content, length: 500)
    sanitize(content[0..length], tags: %w(br))
  end
end
