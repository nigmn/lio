class ReverseController < ApplicationController
 
  def exit
    session[:current_user_id] = nil if session[:current_user_id]
    redirect_to '/'
  end
  
  def login
    if @usr = User.authenticate(params[:l], params[:p])
      session[:current_user_id] = @usr.id
      redirect_to '/reverse/in'
    end
  end

  def auth
  end

  def in
  end

  def out
    t=params[:val].to_i
    if t!=0 && session[:current_user_id]
    @result = params[:val].to_i.downto(2).map { |i|
      [i.to_s, i.to_s(2), i.to_s(2).reverse, i.to_s(2).reverse.to_i(2).to_s]
    }
    else
      render "unlog.html"
    end
  end
end
