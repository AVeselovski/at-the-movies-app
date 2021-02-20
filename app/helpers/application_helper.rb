module ApplicationHelper
  def get_selected_venue
    venue = user_signed_in? and current_user.selected_venue ? Venue.find(current_user.selected_venue) : nil
  end

  def get_flash_type(type)
    case type
    when "alert"
      "error"
    when "notice"
      "info"
    else
      type
    end
  end

  def is_owner(venue)
    venue.venue_users.where(id: venue.id).first.user_id == current_user.id
  end

  def is_author(movie)
    movie.added_by == current_user.id
  end
end
