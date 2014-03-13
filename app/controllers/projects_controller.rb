class ProjectsController < ApplicationController
  def index 
  end

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(params[:post])
  	@project.save
  	redirect_to @project
  end

end

