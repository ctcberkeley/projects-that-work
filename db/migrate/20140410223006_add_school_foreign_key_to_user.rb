class AddSchoolForeignKeyToUser < ActiveRecord::Migration
  def change
  	add_reference :schools, :users, index: true
  end
end
