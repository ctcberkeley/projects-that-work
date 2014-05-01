class RemoveColumnsFromProject < ActiveRecord::Migration
  def change
  	remove_column :projects, :startDate
  	remove_column :projects, :endDate
  	remove_column :projects, :numStudents
  	add_column :projects, :scale, :string
  	add_column :projects, :type, :string
  	add_column :projects, :learningStandards, :string
  	add_column :projects, :preparation, :string, array: true, default: '{}'
  	add_column :projects, :conclusion, :string, array: true, default: '{}'
  	add_column :projects, :materials, :string 
  end
end
