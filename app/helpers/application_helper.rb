module ApplicationHelper

  def current_users
    @current_users ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_users
  end


end
