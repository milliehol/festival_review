module ApplicationHelper
  def render_nav_bar
    if verified_user
      render partial: 'layouts/loggedin_links'
    else
      render partial: 'layouts/loggedout_links'
    end
  end
end
