class AddStudentProjectClassRefToProjectClass < ActiveRecord::Migration
  def change
  	add_reference :project_classes, :student_project_class, :index => true
  end
end
