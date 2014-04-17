class CreateStudentProjects < ActiveRecord::Migration
  def change
    create_table :student_projects do |t|
      t.integer :student_id, :null => false
      t.integer :project_id, :null => false
      t.timestamps
  	end
  end
end
