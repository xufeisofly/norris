class CreateBlueSpaceSceneRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :blue_space_scene_relations do |t|
      t.integer :scene_id
      t.string :answer
      t.integer :next_scene_id

      t.timestamps
    end
    add_index :blue_space_scene_relations, :scene_id
    add_index :blue_space_scene_relations, :next_scene_id
  end
end
