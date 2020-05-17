class FestivalsController < ApplicationController
  def index
    if current_city
      @festival = Festival.where('city_id = ?', current_city.id)
    else
      flash[:error] = "Please select a city to continue."
      redirect_to cities_path
    end
  end

  def new
    @festival = Festival.new
    @festival.build_city
  end

  def create
    @festival = Festival.new(festival_params)
    @festival.user_id = session[:user_id]
    if @festival.save
      redirect_to festival_path(@festival)
    else
      render :new
    end
  end

  def show
    @festivals = Festival.all
  end

  private

  def festival_params
    params.require(:festival).permit(:name, :city, :city_id, city_attributes: [:name])
  end
end
