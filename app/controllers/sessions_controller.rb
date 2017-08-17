class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    # binding.pry
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      flash[:message] = "Invalid login or password"
      redirect_to login_path
    end
  end
end
