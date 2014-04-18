class School < ActiveRecord::Base
	has_many :users
	validates_presence_of :name, :city, :state, :zip
end
