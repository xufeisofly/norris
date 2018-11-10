class RenameBlueSpaceScenceTo < ActiveRecord::Migration[5.2]
  def change
    rename_table :blue_space_scences, :blue_space_scenes
  end
end
