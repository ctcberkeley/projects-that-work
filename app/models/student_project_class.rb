class StudentProjectClass < ActiveRecord::Base
	belongs_to :student
	belongs_to :project_class
end
