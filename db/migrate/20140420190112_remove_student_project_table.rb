class RemoveStudentProjectTable < ActiveRecord::Migration
  def change
  	drop_table :student_projects
  end
end
