class CitiesController < ApplicationController
  before_action :verified_user

  def index
    @cities = City.all
  end

  def show
    @cities = City.all
  end

end
