class DropStudentTeacherReviewsTable < ActiveRecord::Migration
  def change
  	drop_table :student_reviews
  	drop_table :teacher_reviews
  end
end
