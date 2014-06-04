class ProjectsController < ApplicationController
before_action :verify_login, only: [:new, :create, :edit, :update, :show]
before_action :verify_teacher, only: [:new, :create, :edit, :update] 
before_action :set_project, only: [:show]  
before_action :get_review, only: [:show]
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
    @average_student_score = @project.average_student_score()
    @average_teacher_score = @project.average_teacher_score()
    @average_scores = @project.all_average_scores()
    @overallScore = @average_scores[0]
    @implementationScore = @average_scores[1]
    @planningScore = @average_scores[2]
    @learningScore = @average_student_score[3]
    @educatorScore = @average_teacher_score[3]
    @reviewed = !@review.nil?
  end

  private 
  	def project_params
		params.require(:project).permit(:name, :duration, :description,  :scale, :learningStandards, :preparation, :startDate, :endDate, :grade, :course, :numStudents)
	end

    def set_project
      @project = Project.find params[:id]
    end

    def get_review
      @review = current_user.get_project_review(@project.id)
    end
end
