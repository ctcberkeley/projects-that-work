class ProjectsController < ApplicationController
  def index 
    if params[:search]
      @projects = Project.search(params[:search])
    else
      @projects = Project.all
    end
  end

  def new
    if not current_user
      redirect_to login_path, 
      flash[:notice] = "Please Log-In as a Teacher to Create a Project"
    elsif user_is_teacher
  	 @project = Project.new
    else
      redirect_to root_path
      flash[:notice] = "Only Teachers can Create New Projects"
    end
  end

  def create
  	@project = Project.new(project_params)
    @teacher = Teacher.get_teacher(current_user.id)
    @project.teacher_id = @teacher.id
  	if @project.save
      @teacher.projects.build(params[:project].permit[:teacher_id])
  	 redirect_to projects_path
     flash[:success] = "Project Created Successfully"
    else
      render :action => 'new' 
    end
  end

  def show 
	 @project = Project.find(params[:id])
   @average_score = @project.get_average_score()
  end

  private 
  	def project_params
		params.require(:project).permit(:name, :description, :startDate, :endDate, :grade, :course, :numStudents)
	end

 

end

