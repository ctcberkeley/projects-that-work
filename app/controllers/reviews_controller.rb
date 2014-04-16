class ReviewsController < ApplicationController
  def edit
  end

  def new
  	if not current_user
  		redirect_to root_path
  	else
  		@current_user = current_user
  		@review
  		if user_is_teacher
  			@review = TeacherReview.new
  		else 
  			@review = StudentReview.new
  		end	
	end
  end

  def create
  	@review
  	@current_user = current_user
  	if user_is_teacher
  		@review = TeacherReview.new(teacherReview_params)
  		@review.user_id = current_user.id
  	current_user.reviews.build(params[:teacher_review].permit[:user_id])
  	else
  		@review = StudentReview.new(studentReview_params)
  		@review.user_id = current_user.id
  	current_user.reviews.build(params[:student_review].permit[:user_id])
  	end
  	
    if @review.save
      redirect_to root_path, :notice => "Review Created Successfully"
    else
      render :action => 'new'
    end
  end

  def delete
  end

  def show
  end

   private 
    def teacherReview_params
      params.require(:teacher_review).permit(:project_id, :overallScore, :planningScore, :implementationScore, :educatorScore, :comment)
    end

     def studentReview_params
      params.require(:student_review).permit(:project_id, :overallScore, :planningScore, :implementationScore, :learningScore, :repeatabilityScore, :enjoyabilityScore, :comment)
    end
end
