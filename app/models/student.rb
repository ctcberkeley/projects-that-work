class Student < ActiveRecord::Base
	has_one :user
	has_many :student_project_classes
	has_many :project_classes, :through => :student_project_classes
	
	def user
		(User.find_by id: self.user_id)
	end

	def school
		(User.find_by id: self.user_id).school
	end

	def first_name
		(User.find_by id: self.user_id).first_name
	end

	def last_name
		(User.find_by id: self.user_id).last_name
	end

	def self.get_student(id)
		Student.find_by user_id: id
	end

	def self.get_student_by_email(email)
		self.get_student (User.find_by email: email).id
	end

	def get_name()
		user = self.user
		return user.first_name + " " + user.last_name
	end
end
