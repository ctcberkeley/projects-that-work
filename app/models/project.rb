class Project < ActiveRecord::Base
	has_one :project_plan
	has_many :reviews
	has_many :student_reviews
	has_many :teacher_reviews

	belongs_to :teacher
	has_many :student_projects
	has_many :students, :through => :student_projects

	def self.search(search)
		search_condition = "%" + search + "%"
  		find(:all, :conditions => ['name LIKE ? OR description LIKE ?', search_condition, search_condition])
	end

end
