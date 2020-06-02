class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :welcome]
  
  def welcome
    @user = User.new
  end

  def new
  end

  def create

    if  params[:provider] == 'github'
      @user = User.create_by_github_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)

    elsif  @user = User.find_by(username: params[:user][:username])
      #did we find someone & did they put in the right password?
      @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      
    else

      redirect_to login_path

    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end