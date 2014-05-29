class StudentReview < Review
	validates_presence_of :learningScore
	hstore_accessor :field,
  	learningScore: :integer,
   	impactScore: :integer,
    enjoyabilityScore: :integer,
    repeatabilityScore: :integer
end
