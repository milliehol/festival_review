module ApplicationHelper
  def current_city
    @current_city ||= City.find(session[:city_id]) if session[:city_id]
  end

  def current_festival
    @current_festival ||= Festival.find(session[:festival_id]) if session[:festival_id]
  end
end
