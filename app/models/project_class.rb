class ProjectClass < ActiveRecord::Base
	belongs_to :teacher
	belongs_to :project
	has_many :student_project_classes
	has_many :students, :through => :student_project_classes

	def get_project
		Project.find(self.project_id)
	end

	def self.search(search)
		search_condition = "%" + search + "%"
  		find(:all, :conditions => ['name LIKE ? OR description LIKE ?', search_condition, search_condition])
	end

	def self.classes_by_project_id(id)
			where(project_id: Integer(id)).order("created_at ASC")
	end

	def student_reviews
		self.students.map!{ |s| s.get_review(self.project_id) }
	end

#returns Array exactly what project method returns
	def average_student_review
		get_project.average_student_score(student_reviews)
	end
end
