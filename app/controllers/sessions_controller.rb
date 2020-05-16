class SessionsController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  
   def welcome
    @user = User.new
  end

  def new
  end

  def create
    if @user = User.find_by(username: params[:user][:username])
      #did we find someone & did they put in the right password?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end
end