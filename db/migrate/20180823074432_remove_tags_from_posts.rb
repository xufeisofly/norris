# frozen_string_literal: true

class RemoveTagsFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :tags
  end
end
