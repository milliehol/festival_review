class CitiesController < ApplicationController
  #before_action :redirect_if_not_logged_in
  #
  def index
    @cities = City.all
  end

  def show
    @cities = City.all
  end

end
