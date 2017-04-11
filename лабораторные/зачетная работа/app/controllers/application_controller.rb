class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :is_admin?;
  
  private
  
  def current_user
    @current_user ||= User.find_by_id(session[:current_user_id]) if session[:current_user_id]
  end
  public

  def logged_in?
    !!current_user
  end

  def is_admin?
    if logged_in?
	  return User.find_by_id(session[:current_user_id]).role == 'admin'
	end
  end
end
