class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :welcome]
  
   def welcome
    @user = User.new
  end

  def new
  end

  def create

    if params[:provider] == 'facebook_auth_code'
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      end
    else
      @user = User.find_by(username: params[:user][:username])
      #did we find someone & did they put in the right password?
      if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      else
      redirect_to login_path
      end
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