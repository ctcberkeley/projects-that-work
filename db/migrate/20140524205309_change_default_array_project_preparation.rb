class ChangeDefaultArrayProjectPreparation < ActiveRecord::Migration
  def change
     remove_column :projects, :preparation
     add_column :projects, :preparation, :string, array: true 
  end
end
