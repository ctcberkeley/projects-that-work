class AddPasswordFieldToProjectClass < ActiveRecord::Migration
  def change
  	add_column :project_classes, :password, :string 
  end
end
