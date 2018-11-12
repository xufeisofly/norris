class AddNextIdToBlueSpaceScene < ActiveRecord::Migration[5.2]
  def change
    add_column :blue_space_scenes, :next_id, :integer
    add_index :blue_space_scenes, :next_id
  end
end
