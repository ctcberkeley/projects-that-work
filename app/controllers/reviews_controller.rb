class ReviewsController < ApplicationController

  def new
    if current_user
      @user = current_user.get_teacher_or_student
      @reviewable_projects = current_user.reviewable_projects
      if @reviewable_projects.length == 0
        redirect_to root_path
        flash[:notice] = "You have no new projects to review. You may edit a project review from the project page."
      end
      if user_is_teacher
        @review = TeacherReview.new
      else 
        @review = StudentReview.new
      end
    else
      redirect_to root_path
      flash[:notice] = "You must be logged in to review a project"
    end
  end

   def edit
    if current_user
      @reviewable_projects = [Project.find(params[:id])]
      @user = current_user.get_teacher_or_student
      #or Teacher_Reviews.find_by current_user_id maybe faster
      @review = current_user.get_project_review(2)
    else
      redirect_to root_path
      flash[:notice] = "You must be logged in to review a project"
    end
  end

    def update
    @review = current_user.get_project_review(params[:id])
    review_params 
    if user_is_teacher  
      review_params = teacher_review_params
    else
      review_params = student_review_params
    end
    
    if @review.update_attributes(review_params)
      redirect_to root_path, :notice  => "Account Info Updated"
    else
      render :action => 'edit'
    end
  end

  def create
    @user = current_user.get_teacher_or_student
    if user_is_teacher
      @review = TeacherReview.new(teacher_review_params)
      @review.user_id = current_user.id
      current_user.reviews.build(params[:teacher_review].permit[:user_id])
    else
      @review = StudentReview.new(student_review_params)
      @review.user_id = current_user.id
      current_user.reviews.build(params[:student_review].permit[:user_id])
    end

    if @review.save
      redirect_to root_path
      flash[:success] = "Review created successfully"
    else
      render :action => 'new'
    end
  end

  private 
    def teacher_review_params
      params.require(:teacher_review).permit(:project_id, :overallScore, :planningScore, :implementationScore, :educatorScore, :comment)
    end

    def student_review_params
      params.require(:student_review).permit(:project_id, :overallScore, :planningScore, :implementationScore, :learningScore, :repeatabilityScore, :enjoyabilityScore, :comment)
    end
end
