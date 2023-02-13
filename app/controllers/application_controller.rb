class ApplicationController < ActionController::Base

  helper_method :current_users,:logged_in?

  def current_users
    @current_users ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_users
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path
    end
  end

end
