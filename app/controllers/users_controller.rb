class UsersController < ApplicationController
	skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @review = @user.reviews
    redirect_to root_path if !@user
  end
  
  private

  def user_params
    params.require(:user).permit(
      :name,
      :uid,
      :username,
      :email,
      :password
    )
  end

end
