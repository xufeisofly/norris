# frozen_string_literal: true

class CreateBlueSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :blue_spaces do |t|
      t.integer :player_id
      t.integer :current_scene_id

      t.timestamps
    end
    add_index :blue_spaces, :player_id
    add_index :blue_spaces, :current_scene_id
  end
end
