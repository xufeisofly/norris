class RenameBlueSpaceConversationScenceIdName < ActiveRecord::Migration[5.2]
  def change
    rename_column :blue_space_conversations, :scence_id, :scene_id
  end
end
