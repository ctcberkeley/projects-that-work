class CreateProjectPlans < ActiveRecord::Migration
  def change
    create_table :project_plans do |t|
		t.string :projectSteps # file location to pdf
		# Add Contents Here TODO content - hash of {file_location: purpose}
		# Add Materials Here TODO materials - hash of {material (string): cost (int)}
		t.string :learningGoals # file location to PDF of learning goals on server
		t.string :fundraisingStrat # url
		t.string :assessment # file location to PDF of assessment on server
        t.timestamps
    end
  end
end
