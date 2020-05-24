class CitiesController < ApplicationController
  before_action :verified_user

  def index
    @cities = City.all
  end

  def show
    @cities = City.all
  end

  private

  def city_params
    params.require(:festival).permit(:name, :state )
  end

end
