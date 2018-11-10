# frozen_string_literal: true

class AddContentTypeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :content_type, :integer, comment: '文件格式'
  end
end
