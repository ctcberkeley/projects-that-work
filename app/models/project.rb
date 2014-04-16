class Project < ActiveRecord::Base
	has_one :project_plan
	belongs_to :user
	has_many :reviews
	has_many :student_reviews
	has_many :teacher_reviews
	def self.search(search)
		search_condition = "%" + search + "%"
  		find(:all, :conditions => ['name LIKE ? OR description LIKE ?', search_condition, search_condition])
	end

end
