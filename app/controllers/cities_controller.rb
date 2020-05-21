class CitiesController < ApplicationController
  before_action :verified_user

  def index
    @cities = City.alpha
  end

  def show
    @cities = City.all
  end

end
