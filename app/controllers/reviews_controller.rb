class ReviewsController < ApplicationController
  #before_action :redirect_if_not_logged_in

  def new
    #need festival_id b/c of nested route
    if @festival = Festival.find_by_id(params[:festival_id])
      #nested route
      @review = @festival.reviews.build
    else
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @reviews = Review.all
  end

  def index
    #how do i check if it's nested & a valid id
    if @festival = Festival.find_by_id(params[:festival_id])
      #nested
      @reviews = @festival.reviews
    else
      #it's not nested
      @reviews = Review.all
    end
  end

  private

  def review_params
    params.require(:review).permit(:festival_id, :content, :rating)
  end
end
