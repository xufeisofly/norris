# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :avatar_url
      t.text :html_url
      t.integer :github_user_id, index: true

      t.timestamps
    end
  end
end
