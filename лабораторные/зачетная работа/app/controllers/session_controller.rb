class SessionController < ApplicationController
  def new
  end

  def create
    if not logged_in? 
	  user = User.find_by(login: params[:login], password: params[:password])
	  if user != nil
		session[:current_user_id]=user.id
		redirect_to "/users/show/#{session[:current_user_id]}"
	  else 
		flash[:notice] = "Пользователь не найден"
		redirect_to root_path
	  end
	  else
	    redirect_to root_path
	end
  end

  def destroy
    if logged_in?
      @current_user = session[:current_user_id] = nil
	  redirect_to root_url
	else
	  redirect_to root_url
	end
  end

end
