require 'spec_helper'

describe UserController, :type => :controller do

 describe '#new' do
  	context 'when passes validations' do
  			context 'user role is teacher' do
  			user = build(:user :teacher)

  		end

  		context 'user role is student' do
  			user = build(:user :student)
  		end
  	end
  end

  describe '#create' do
  	context 'when passes validations' do
  		context 'user role is teacher' do
  			user = create(:user :teacher)
  			user.role should equal 'Teacher'
  		end

  		context 'user role is student' do
  			user = create(:user :student)
  			user.role should equal 'Student'
  		end
  		it {should redirect_to 'home page'}
  	end

  	context 'when fails validations' do
  		it {should redirect_to 'sign up page'}
  	end
	end

	describe '#edit' do
		context 'when logged in' do
		end
		context 'when logged out' do
			it {should redirect_to 'home page'}
		end

	end

	describe '#update' do
		context 'when logged in' do
		end
		context 'when logged out' do
			it {should redirect_to 'home page'}
		end
	end

	describe '#show' do
		context 'when logged in' do
		end
		context 'when logged out' do
			it {should redirect_to 'home page'}
		end
	end
end
