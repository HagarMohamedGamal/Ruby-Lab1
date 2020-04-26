class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    $EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    if $EMAIL_REGEX.match(login_params[:username]) 
      @user = User.find_by(email: login_params[:username])
    else
      @user = User.find_by(username: login_params[:username])
    end
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end

    # render plain: @user.inspect
  end

  def destroy
    @user = current_user
    session[:user_id] = nil 
    redirect_to root_path
  end

  private
  def login_params
    params[:user].permit(:username, :password)
  end
end
