class AddTeacherToProjectClass < ActiveRecord::Migration
  def change
  	add_reference :project_classes, :teacher, :index => true
  end
end
