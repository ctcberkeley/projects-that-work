class ProjectClassHasOneTeacher < ActiveRecord::Migration
  def change
  	  	add_reference :teachers, :project_class, index: true
  end
end
