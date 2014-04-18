class SchoolsController < ApplicationController
	
	def new
		@school = School.new
	end

	def create
		@school = School.new(school_params)
		if @school.save
			redirect_to new_user_path, :notice => "Your school was successfully added!"
		else
			render :action => 'new'
		end
	end

	private
		def school_params
			params.require(:school).permit(:name,:city,:state,:zip)
		end
end
