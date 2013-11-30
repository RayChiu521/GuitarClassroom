class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  helper_method :current_user, :logged_in?, :is_admin?, :is_teacher?

  def logged_in?
    !!current_user
  end

  def is_admin?
    current_user && current_user.is_admin?
  end

  def is_teacher?
    current_user && current_user.is_teacher?
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      redirect_to log_in_path
    end
  end
end
