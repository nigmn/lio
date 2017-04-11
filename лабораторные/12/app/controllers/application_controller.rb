class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :log, :except => [:login, :index, :new, :auth, :create]
  
private
def current_user
  @_current_user ||= session[:current_user_id] &&  User.find_by_id(session[:current_user_id])
end

def log
  unless current_user
    redirect_to '/reverse/auth'
  end
end
end
