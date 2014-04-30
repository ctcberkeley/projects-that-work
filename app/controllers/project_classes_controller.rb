class ProjectClassesController < ApplicationController
  before_action :set_project

	def index 
		if params[:search]
		  @projectclasses = ProjectClass.search(params[:search])
		else
		  @projectclasses = ProjectClass.all
		end
	end

  def new
    if not current_user
      redirect_to new_user_session_path 
      flash[:notice] = "Please Log-In as a Teacher to Create a Project Class"
    elsif user_is_teacher
      @projectclass = ProjectClass.new
    else
      redirect_to root_path, 
      flash[:notice] = "Only Teachers can Create New Project Classes"
    end
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
  end

  private 
  	def project_class_params
		params.require(:project_class).permit(:password, :project_id)
	end

  def set_project 
      @project = Project.find params[:project_id]
  end
end
