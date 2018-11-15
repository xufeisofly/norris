class AddBlueSpaceIdToLog < ActiveRecord::Migration[5.2]
  def change
    add_column :blue_space_logs, :blue_space_id, :integer
    add_index :blue_space_logs, :blue_space_id
  end
end
