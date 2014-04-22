class Teacher < ActiveRecord::Base
	has_one :user
	has_many :projects, :dependent => :destroy
	has_many :project_classes, :dependent => :destroy

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

	def self.get_teacher(id)
		Teacher.find_by user_id: id
	end

	def get_name()
		user = self.user
		return user.first_name + " " + user.last_name
	end
end
