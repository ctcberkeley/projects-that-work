class ProjectsHaveOneTeacher < ActiveRecord::Migration
  def change
  	  	add_reference :teachers, :project, index: true
  end
end
