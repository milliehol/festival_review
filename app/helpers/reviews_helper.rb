module ReviewsHelper

  def display_header(review)
    if params[:festival_id]
      content_tag(:h1, "Add a Review for #{review.festival.name} -  #{review.festival.city.name}")
    else
      content_tag(:h1, "Write a review")
    end
  end

end
