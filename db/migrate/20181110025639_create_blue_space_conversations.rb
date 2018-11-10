class CreateBlueSpaceConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :blue_space_conversations do |t|
      t.text :content
      t.integer :category
      t.integer :delay
      t.integer :scence_id

      t.timestamps
    end
    add_index :blue_space_conversations, :scence_id
  end
end
