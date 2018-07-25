class Post < ApplicationRecord
  enum content_type: { md: 1, org: 2 }

  self.per_page = 10
end
