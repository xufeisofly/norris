# frozen_string_literal: true

class CreateBlueSpaceScences < ActiveRecord::Migration[5.2]
  def change
    create_table :blue_space_scences do |t|
      t.string :name
      t.integer :current_conversation_id, index: true
      t.timestamps
    end
  end
end
