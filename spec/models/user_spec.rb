require 'spec_helper'

describe User, :type => :model do
  describe '#new' do
  	context 'when passes validations' do
  	end
  end

  describe '#create' do
  	context 'when passes validations' do
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
