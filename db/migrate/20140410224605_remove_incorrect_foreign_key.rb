class RemoveIncorrectForeignKey < ActiveRecord::Migration
  def change
  	remove_reference :schools, :users, index: true
  end
end
