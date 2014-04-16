class Review < ActiveRecord::Base
	acts_as_superclass
	belongs_to :user
	belongs_to :project
end
