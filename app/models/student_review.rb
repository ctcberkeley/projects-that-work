class StudentReview < ActiveRecord::Base
	acts_as :review, :as => :reviewable 
end
