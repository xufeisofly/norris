class AddUniqueIndexToTagName < ActiveRecord::Migration[5.2]
  def change
    remove_index :tags, :name
    add_index :tags, :name, unique: true
  end
end
