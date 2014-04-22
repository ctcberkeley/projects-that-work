class ProjectClass < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :project
	has_many :student_project_classes
	has_many :students, :through => :student_project_classes
	

	def self.search(search)
		search_condition = "%" + search + "%"
  		find(:all, :conditions => ['name LIKE ? OR description LIKE ?', search_condition, search_condition])
	end

	 
end
