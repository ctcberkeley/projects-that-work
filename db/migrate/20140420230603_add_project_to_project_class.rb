class AddProjectToProjectClass < ActiveRecord::Migration
  def change
  	add_reference :project_classes, :project, :index => true
  end
end
