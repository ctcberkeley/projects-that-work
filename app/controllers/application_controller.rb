class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_user_session, :user_is_teacher, :user_is_student

   rescue_from(ActiveRecord::RecordNotFound) {
    response_to_missing_resource
  }

  before_action :set_previous_url 
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    def user_is_teacher
      return current_user.is_teacher
    end

    def user_is_student
      return current_user.is_student
    end

    def verify_login
    	if not current_user
      	redirect_to new_user_session_path 
      	flash[:notice] = "Please log in to view this page"
      end
    end

    def verify_teacher
    	if not user_is_teacher
    		redirect_to new_user_session_path 
      	flash[:notice] = "Only teachers can view this page"
      end
    end

    def on_success(saved, object, action, objects_path)
    	if saved
    		redirect_to send(objects_path)
    	  flash[:success] = object.camelize.singularize + " Created Successfully"
    	else
         flash[:error] = object.camelize.singularize + " was not created"
      	 render :action => action 
    	end
    end

    def set_previous_url
      session[:return_to] = request.referer
    end

    def response_to_missing_resource
      redirect_to session.delete(:return_to) || root_path
      flash[:notice] = "The page you are looking for is not found."
    end
end
