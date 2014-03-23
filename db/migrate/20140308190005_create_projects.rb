class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :startDate
      t.date :endDate
      t.integer :duration
      t.integer :grade
      t.string :course
      t.integer :numStudents
      t.string :description

      t.timestamps
    end
  end
end
