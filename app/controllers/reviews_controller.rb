class ReviewsController < ApplicationController
before_action :verify_login, only: [:new, :create, :edit, :update]
before_action :set_review, only: [:edit, :update]  
before_action :set_user, only: [:new, :edit, :create]
  def new
      @reviewable_projects = current_user.reviewable_projects
      #check if possible to create new review
      can_create_review?
      if user_is_teacher
        @review = TeacherReview.new
      else 
        @review = StudentReview.new
      end
      @review_url = new_review_path
  end

  def edit
    @reviewable_projects = [@review.get_project]
    #or Teacher_Reviews.find_by current_user_id maybe faster
    @review_url = review_path(@review)
  end

  def update
    review_params = nil
    if user_is_teacher  
      review_params = teacher_review_params
    else
      review_params = student_review_params
    end
    
    if @review.update_attributes(review_params)
      redirect_to root_path
      flash[:notice]  = "Review Updated Successfully"
    else
      render :action => 'edit'
    end
  end

  def create
    if user_is_teacher
      @review = TeacherReview.new(teacher_review_params)
      @review.user_id = current_user.id
      current_user.reviews.build(params[:teacher_review].permit[:user_id])
    else
      @review = StudentReview.new(student_review_params)
      @review.user_id = current_user.id
      current_user.reviews.build(params[:student_review].permit[:user_id])
    end
    saved = false
    if @review.save
      saved = true
    end
    on_success(saved,"reviews","new","root_path")
  end

  private 
    def teacher_review_params
      params.require(:teacher_review).permit(:project_id, :overallScore, :planningScore, :implementationScore, :educatorScore, :comment)
    end

    def student_review_params
      params.require(:student_review).permit(:project_id, :overallScore, :planningScore, :implementationScore, :learningScore, :repeatabilityScore, :enjoyabilityScore, :comment)
    end

    def set_review
      @review = Review.find params[:id]
    end

    def set_user
      @user = current_user.get_teacher_or_student
    end

    def can_create_review?
     if @reviewable_projects.length == 0
        redirect_to root_path
        flash[:notice] = "You have no new projects to review. You may edit a project review from the project page."
      end
    end

end
