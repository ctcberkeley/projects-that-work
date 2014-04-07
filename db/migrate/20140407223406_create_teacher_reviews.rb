class CreateTeacherReviews < ActiveRecord::Migration
  def change
    create_table :teacher_reviews do |t|
      t.integer :educatorScore
      t.timestamps
    end
  end
end
