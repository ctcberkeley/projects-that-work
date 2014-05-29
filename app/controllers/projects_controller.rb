class ProjectsController < ApplicationController
before_action :verify_login, only: [:new, :create, :edit, :update, :show]
before_action :verify_teacher, only: [:new, :create, :edit, :update] 
  def index
    if params[:search]
      @projects = Project.search(params[:search])
    else
      @projects = Project.all
    end
  end

  def new
      @project = Project.new
  end

  def create
  	@project = Project.new(project_params)
    @teacher = Teacher.get_teacher(current_user.id)
    @project.teacher_id = @teacher.id
    saved = false
  	if @project.save
      @teacher.projects.build(params[:project].permit[:teacher_id])
      saved = true
    end

    on_success(saved,"projects", "new","projects_path")

  end

  def show 
    proj_id = params[:id]
    @project = Project.find(proj_id)
    @average_scores = @project.all_average_scores()
    @overallScore = @average_scores[0]
    @implementationScore = @average_scores[1]
    @planningScore = @average_scores[2]
    @reviewed = current_user.has_reviewed_project?(@project.id)
  end

  private 
  	def project_params
		params.require(:project).permit(:name, :duration, :description,  :scale, :learningStandards, :preparation, :startDate, :endDate, :grade, :course, :numStudents)
	end

end
