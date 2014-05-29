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

	def average_student_score()
		num = self.student_reviews.size
		totals = Array.new(4,0)
		if num != 0
			self.student_reviews.each do |r|
				totals[0] += r.overallScore
				totals[1] += r.implementationScore
				totals[2] += r.planningScore
				totals[3] += r.learningScore			
			end
			return totals.map!{|score| score/num}
		else
			return Array.new(4,"no reviews yet") 
		end
	end

	def average_teacher_score()
		num = self.teacher_reviews.size
		totals = Array.new(4,0)
		if num != 0
			self.teacher_reviews.each do |r|
				totals[0] += r.overallScore
				totals[1] += r.implementationScore
				totals[2] += r.planningScore
				totals[3] += r.educatorScore			
			end
			return totals.map!{|score| score/num} 
		else
			return Array.new(4,"no reviews yet") 
		end
	end

	def all_average_scores()
		num = self.reviews.size
		totals = Array.new(3,0)
		if num != 0
			self.reviews.each do |r|
				totals[0] += r.overallScore
				totals[1] += r.implementationScore
				totals[2] += r.planningScore			
				end
			return totals.map!{|score| score/num} 
		else
			return Array.new(3,"no reviews yet")
		end 
	end
end
