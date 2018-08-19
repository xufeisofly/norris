class AddTagsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :tags, :string, array: true, default: [], comment: '标签'
  end
end
