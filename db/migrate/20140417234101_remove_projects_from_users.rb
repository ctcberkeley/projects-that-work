class RemoveProjectsFromUsers < ActiveRecord::Migration
  def change
  	remove_reference :users, :project, :index => true
  end
end
