class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, :notice => "Sign Up Successful"
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
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
end
