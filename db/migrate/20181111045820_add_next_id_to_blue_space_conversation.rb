class AddNextIdToBlueSpaceConversation < ActiveRecord::Migration[5.2]
  def change
    add_column :blue_space_conversations, :next_id, :integer
    add_index :blue_space_conversations, :next_id
  end
end
