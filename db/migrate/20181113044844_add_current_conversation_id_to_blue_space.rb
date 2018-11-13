class AddCurrentConversationIdToBlueSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :blue_spaces, :current_conversation_id, :integer
    add_index :blue_spaces, :current_conversation_id
    remove_column :blue_space_scenes, :current_conversation_id
  end
end
