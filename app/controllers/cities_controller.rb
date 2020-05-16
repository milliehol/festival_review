class CitiesController < ApplicationController
  #before_action :redirect_if_not_logged_in
  #
  def index
    @city = City.alpha
  end

  def show
    @cities = City.all
  end

end
