class UsersController < ApplicationController
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
      @role.user_id = (User.find_by email: @user.email).id
      if @role.save
        redirect_to root_path, :notice => "Sign Up Successful"
      else
        sucess = false
      end
    else
      success = false
    end

    if not success
      render :action => 'new'
    end
  end


  def edit
    @user = current_user
  end


  def show
    if not current_user
      redirect_to login_path, :notice => "Please Log-In to View Profiles"
    else
      @user = User.find(params[:id])
    end
  end


  def update
    @user = current_user
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
end
