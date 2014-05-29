class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	validates_presence_of :overallScore

	def get_project
		Project.find(self.project_id)
	end
end
