# frozen_string_literal: true

class AddDescImgToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :desc_img, :string, limit: 255
  end
end
