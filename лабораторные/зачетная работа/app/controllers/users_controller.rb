class UsersController < ApplicationController
  def index
    if is_admin?
      @users = User.all
	else
	  redirect_to root_url, notice: 'Нет полномочий администратора'
	end
  end

  def show
    if logged_in?
      @user = User.find_by_id(params[:id])
	else
	  redirect_to root_url, notice: 'Сначала войдите!'
	end
  end

  def new
  end

  def edit
    if logged_in?
      @user = User.find_by_id(session[:current_user_id])
	else
	  redirect_to root_url, notice: 'Сначала войдите!'
	end
  end

  def update
    if logged_in?
      @user = User.find_by_id(session[:current_user_id])
      @user.update(:login => params[:login], :password => params[:password])
	  redirect_to "/users/show/#{session[:current_user_id]}", notice: 'Данные успешно изменены'
	else
	  redirect_to root_url, notice: 'Сначала войдите!'
	end
  end

  def create
    @code = '12345'
    if params[:password] == params[:password_c]
	  if (params[:code] == @code)
	    @user = User.new(login: params[:login], password: params[:password], role: 'admin')
	  else
	    @user = User.new(login: params[:login], password: params[:password], role: 'user')
	  end
	  if @user.save
		redirect_to root_url, notice: 'Регистрация прошла успешно'
	  else
		flash[:notice] = 'Логин слишком длинный или занят'
		render :new
	  end
	else
	   flash[:notice] = 'Пароль не совпадает!'
	   render :new
	end
  end

  def destroy
    if logged_in?
	  @user = User.find_by_id(session[:current_user_id])
	  @current_user = session[:current_user_id] = nil
      @user.destroy
      redirect_to root_url, notice: 'Пользователь удален!'
	else
	  redirect_to root_url, notice: 'Сначала войдите!'
	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :password, :role)
    end

end
