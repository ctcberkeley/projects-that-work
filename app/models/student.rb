class Student < ActiveRecord::Base
	has_one :user

	has_many :student_projects
	has_many :projects, :through => :student_projects
	
end
