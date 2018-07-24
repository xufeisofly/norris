module PostsHelper
  def content_preview(content, length: 500)
    preview = sanitize(content[0..length], tags: %w(br))
    content.length <= length ? preview : preview + '...'
  end
end
