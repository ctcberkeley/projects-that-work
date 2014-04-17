class Teacher < ActiveRecord::Base
	has_one :user
	has_many :projects

	def self.get_teacher(id)
		Teacher.find_by user_id: id
	end
end
