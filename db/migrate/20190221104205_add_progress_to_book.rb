class AddProgressToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :progress, :integer, default: 0
  end
end
