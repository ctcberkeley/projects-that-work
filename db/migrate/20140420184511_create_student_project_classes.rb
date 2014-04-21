class CreateStudentProjectClasses < ActiveRecord::Migration
  def change
    create_table :student_project_classes do |t|
      t.integer :student_id, :null => false
      t.integer :project_class_id, :null => false
      t.timestamps
    end
  end
end
