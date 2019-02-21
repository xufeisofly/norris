module BooksHelper
  def display?(bool)
    if bool
      'display: inherit;'
    else
      'display: none;'
    end
  end
end
