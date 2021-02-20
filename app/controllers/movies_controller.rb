class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_venue
  before_action :set_movie, only: %i[ edit update destroy ]
  before_action :check_ownership, only: %i[ edit update destroy ]

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  def create
    movie = Movie.new(movie_params)
    movie.venue = @venue
    movie.added_by = current_user.id

    if movie.save
      flash[:success] = I18n.t 'movie_created'
      redirect_to movies_path
    else
      flash.now[:error] = I18n.t 'errors_abstract'
      render 'new'
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      flash[:success] = I18n.t 'movie_updated'
      redirect_to movies_path
    else
      flash.now[:error] = I18n.t 'errors_abstract'
      render 'edit'
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
    flash[:warning] = I18n.t 'movie_destroyed'
    redirect_to movies_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(current_user.selected_venue)
    end
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :year_of_release, :is_disabled, :disabled_reason)
    end

    # Only venue owner or entry author can edit
    def check_ownership
      if !helpers.is_owner(@venue) and !helpers.is_author(@movie)
        flash[:error] = "Access denied!"
        redirect_to venues_path
      end
    end
end
