class CreateStudentReviews < ActiveRecord::Migration
  def change
    create_table :student_reviews do |t|
      t.integer :learningScore
	  t.integer :impactScore
	  t.integer :enjoyabilityScore
	  t.integer :repeatabilityScore
      t.timestamps
    end
  end
end
