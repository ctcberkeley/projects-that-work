class ReviewsController < ApplicationController

  def new
    if current_user
      @user = current_user.get_teacher_or_student
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
