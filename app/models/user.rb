class User < ApplicationRecord
  validates :github_user_id, presence: true, uniqueness: true
end
