class FestivalsController < ApplicationController
  before_action :set_festival, only:[:show, :edit, :update]
  before_action :verified_user

  def index
    @festivals = Festival.order_by_rating.includes(:city)
  end

  def new
    @festival = Festival.new
    @festival.build_city
  end

  def create
    @festival = Festival.new(festival_params)
    @festival.user_id = session[:user_id]
    if params[:festival][:city_id] == nil
      @festival.build_city
    end
    if @festival.save
      redirect_to festival_path(@festival)
    else
      render :new
    end
  end

  def show
    @festival = Festival.find_by_id(params[:id])
    #@user = User.find(params[:user_id])
    #@festival = Festival.find_by(params[:id])
  end

  def update
    if @festival.update(festival_params)
      redirect_to festival_path(@festival)
    else
      render :edit
    end
  end

  def edit
  end

  private

  def festival_params
    params.require(:festival).permit(:name, :theme, :description, :city_id, city_attributes: [:name, :state])
  end

  def set_festival
    @festival = Festival.find_by(params[:id])
    redirect_to festivals_path if !@festival
  end
end
