class ProjectClassesController < ApplicationController
  before_action :set_project
  before_action :verify_login, only: [:new, :create, :show]
  before_action :verify_teacher, only: [:new, :create, :show]
  
	def index 
		if params[:search]
		  @projectclasses = ProjectClass.search(params[:search])
		else
		  @projectclasses = ProjectClass.classes_by_project_id(params[:project_id])
		end
	end

  def new
    @projectclass = ProjectClass.new
  end

  def create
  	@projectclass = ProjectClass.new(project_class_params)
    @teacher = Teacher.get_teacher(current_user.id)
    @projectclass.teacher_id = @teacher.id
    @projectclass.project_id = @project.id
  	@project.project_classes.build(params[:project_class].permit[:project_id])
    @teacher.project_classes.build(params[:project_class].permit[:teacher_id])
  	if @projectclass.save
      #Add students to project class too

      params[:project_class][:students].split(" ").each do |email|
        @student = Student.get_student_by_email(email)
        if not @student.blank?
          @student_class_project = StudentProjectClass.create!(student_id: @student.id, project_class_id: @projectclass.id)
          @projectclass.student_project_class_id = @student_class_project.id
          @student.project_classes.build(params[:project_class].permit[:student_project_class_id])
          @projectclass.save
        else
          #send invite to student's email to join project class.
          flash[:notice] = "no student with " + email + " found"
        end 
      end
      redirect_to project_class_index_path
      flash[:success] = "Project Class created successfully"  
    end
  end

  def show 
	 @projectclass = ProjectClass.includes(:students).find(params[:id])
   @teacher = @projectclass.teacher
   @average_student_score = @projectclass.average_student_review()
   @overallScore = @average_student_score[0]
   @implementationScore = @average_student_score[1]
   @planningScore = @average_student_score[2]
   @learningScore = @average_student_score[3]
    #@educatorScore = @average_teacher_score[3]
  end

  private 
  	def project_class_params
		params.require(:project_class).permit(:password, :project_id)
	end

  def set_project 
      @project = Project.find params[:project_id]
  end
end
