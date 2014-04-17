class StudentReferenceToUser < ActiveRecord::Migration
  def change
  	    add_reference :students, :user, index: true
  end
end
