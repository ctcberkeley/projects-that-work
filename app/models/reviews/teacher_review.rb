class TeacherReview < Review
	validates_presence_of :educatorScore
	hstore_accessor :field,
  	educatorScore: :integer
end
