class ChangePreparationArray < ActiveRecord::Migration
  def change
     remove_column :projects, :preparation
     add_column :projects, :preparation, :text, array: true, default: '{}'
  end
end
