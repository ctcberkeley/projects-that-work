class ProjectClass < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :project
	has_many :student_project_classes
	has_many :students, :through => :student_project_classes


	def self.search(search)
		search_condition = "%" + search + "%"
  		find(:all, :conditions => ['name LIKE ? OR description LIKE ?', search_condition, search_condition])
	end

	def self.classes_by_project_id(id)
			where(project_id: Integer(id)).order("created_at ASC")
	end
end
