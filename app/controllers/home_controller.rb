class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @venue = current_user.selected_venue ? Venue.find(current_user.selected_venue) : nil
    if @venue
      @movies = @venue.movies
    else
      @movies = []
    end
  end

  def movies
    @venue = current_user.selected_venue ? Venue.find(current_user.selected_venue) : nil
    if @venue
      @movies = @venue.movies
    else
      @movies = []
    end
  end
end
