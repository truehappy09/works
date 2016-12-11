class RenameCategoriesToName < ActiveRecord::Migration
  def change
    rename_column :categories, :categories, :name
  end
end
