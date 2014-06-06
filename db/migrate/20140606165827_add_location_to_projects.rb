class AddLocationToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :city, :string
  	add_column :projects, :state, :string
  	add_column :projects, :zip, :string
  end
end
