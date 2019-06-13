class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:user_username] = @user.username
      redirect_to groups_path
    else
      flash.now[:alert] = "Invalid username or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_username] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
