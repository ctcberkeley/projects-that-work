class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

helper_method :current_user, :current_user_session, :user_is_teacher, :user_is_student

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
end
