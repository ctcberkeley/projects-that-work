class StudentProject < ActiveRecord::Base
	belongs_to :students
	belongs_to :project
end
