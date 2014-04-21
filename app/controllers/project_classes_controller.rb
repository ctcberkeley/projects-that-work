class ProjectClassesController < ApplicationController
	def index 
		if params[:search]
		  @projectclasses = ProjectClass.search(params[:search])
		else
		  @projectclasses = ProjectClass.all
		end
	end

  def new
    if not current_user
      redirect_to login_path, :notice => "Please Log-In as a Teacher to Create a Project Class"
    elsif user_is_teacher
  	 @projectclass = ProjectClass.new()
    else
      redirect_to root_path, :notice => "Only Teachers can Create New Project Classes"
    end
  end

  def create
  	@projectclass = ProjectClass.new(project_class_params)
    @teacher = Teacher.get_teacher(current_user.id)
  
    @projectclass.teacher_id = @teacher.id
    params[:project_class][:students].split(" ").each do |student|
    	@student = Student.get_student_by_email(student)
    	if not @student.blank?
        @projectclass.student_id = @student.id
    		@student.project_classes.build(params[:project_class].permit[:student_id])
      else
        #send invite to student's email to join project class.
        flash[:notice] = "no student with email found"
      end 
    end
    #Need to fix this issue for getting the current project
    #@projectclass.project_id always returns nil
    @project = Project.get_project(1)
  	@project.project_classes.build(params[:project_class].permit[:project_id])
    @teacher.project_classes.build(params[:project_class].permit[:teacher_id])
  	@projectclass.save
    redirect_to project_class_index_path
  end

  def show 
	 @projectclasses = ProjectClass.includes(:students).find(params[:id])
  end

  private 
  	def project_class_params
		params.require(:project_class).permit(:password, :project_id)
	end
end
