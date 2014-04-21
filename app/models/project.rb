class Project < ActiveRecord::Base
	has_one :project_plan
	has_many :project_classes
	has_many :reviews
	has_many :student_reviews
	has_many :teacher_reviews

	belongs_to :teacher

	def self.search(search)
		search_condition = "%" + search + "%"
  		find(:all, :conditions => ['name LIKE ? OR description LIKE ?', search_condition, search_condition])
	end

	def self.get_project(id)
		Project.find_by id: id
	end
end
