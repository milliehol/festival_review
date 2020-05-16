class UsersController < ApplicationController
	#skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if (user = User.create(user_params))
      #need to authenticate?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path if !@user
  end
  
  private

  def user_params
    params.require(:user).permit(
      :name,
      :username,
      :password
    )
  end

end
