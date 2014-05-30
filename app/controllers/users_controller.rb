class UsersController < ApplicationController
before_action :verify_login, only: [:show, :edit, :update]
before_action :set_user, only: [:edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    success = true

    if @user.save
      @role 
      if @user.is_teacher
        @role = Teacher.new(teacher_params)
      elsif @user.is_student
        @role = Student.new(student_params)
      end
      @role.user_id = User.by_email(@user.email).id
      if @role.save
        redirect_to root_path 
        flash[:success] = "Welcome to Projects That Work!"
      else
        success = false
      end
    else
      success = false
    end

    if not success
      render :action => 'new'
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to root_path, :notice  => "Account Info Updated"
    else
      render :action => 'edit'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :role, :school_id)
    end

    def teacher_params
      params.require(:user).permit(:user_id)
    end

    def student_params
      params.require(:user).permit(:user_id)
    end

    def set_user
      @user = current_user
    end
end
