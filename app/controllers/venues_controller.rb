class VenuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_venue, only: %i[ show edit update destroy ]
  before_action :check_ownership, only: %i[ edit update destroy ]

  # GET /venues
  def index
    @venues = Venue.all
  end

  # GET /venues/1
  def show
    user = current_user
    user.selected_venue = @venue.id
    user.save
    
    if user.save
      redirect_to root_path
    else
      flash.now[:error] = I18n.t 'errors_abstract'
      render 'index'
    end
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  def create
    @venue = Venue.new(venue_params)
    @venue.users << current_user

    if @venue.save
      # mark user as the venue owner and select the venue
      venue_user = VenueUser.where(:venue_id => @venue.id).first
      venue_user.is_owner = true
      user = current_user
      user.selected_venue = @venue.id
      user.save

      if venue_user.save and user.save
        flash[:success] = I18n.t 'venue_created'
        redirect_to venue_path(@venue)
      else
        flash.now[:error] = I18n.t 'errors_abstract'
        render 'new'
      end
    else
      flash.now[:error] = I18n.t 'errors_abstract'
      render 'new'
    end
  end

  # PATCH/PUT /venues/1
  def update
    if @venue.update(venue_params)
      flash[:success] = I18n.t 'venue_updated'
      redirect_to venue_path(@venue)
    else
      flash.now[:error] = I18n.t 'errors_abstract'
      render 'edit'
    end
  end

  # DELETE /venues/1
  def destroy
    if @venue.destroy
      flash[:warning] = I18n.t 'venue_destroyed'
      redirect_to venues_path
    else
      flash.now[:error] = I18n.t 'errors_abstract'
    end
  end

  private
    # Setup venue for methods 
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venue_params
      params.require(:venue).permit(:name, :description, :location)
    end

    # Only venue owner can edit
    def check_ownership
      if !helpers.is_owner(@venue)
        flash[:error] = "Access denied!"
        redirect_to venues_path
      end
    end
end
