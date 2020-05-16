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
  end

  def create
    @festival = Festival.new(festival_params)
    if @festival.save
      redirect_to festival_path(@festival)
    else
      render :new
    end
  end

  def show
    session[:festival_id] = params[:id]
    @festival = current_festival
  end

  private

  def festival_params
    params.require(:festival).permit(:name, :city, :city_id)
  end
end
