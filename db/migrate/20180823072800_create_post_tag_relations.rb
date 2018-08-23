class CreatePostTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tag_relations do |t|
      t.integer :post_id, index: true
      t.integer :tag_id, index: true

      t.timestamps
    end
  end
end
