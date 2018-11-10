# frozen_string_literal: true

class CreateBlueSpaceLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blue_space_logs do |t|
      t.integer :player_id
      t.text :conversation_content

      t.timestamps
    end
    add_index :blue_space_logs, :player_id
  end
end
