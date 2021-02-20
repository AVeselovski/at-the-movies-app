class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_venue
  before_action :set_event, only: %i[ show edit update cancel destroy ]
  before_action :check_ownership, only: %i[ edit update cancel destroy ]

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
  end

  # GET /events/1/movies
  def movies
    @movies = Movie.all
  end

  # GET /events/1/attendees
  def attendees
    @users = User.all
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    event = Event.new(event_params)
    event.venue = @venue

    if event.save
      flash[:success] = I18n.t 'event_created'
      redirect_to events_path
    else
      flash.now[:error] = I18n.t 'errors_abstract'
      render 'new'
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      flash[:success] = I18n.t 'event_updated'
      redirect_to events_path
    else
      flash.now[:error] = I18n.t 'errors_abstract'
      render 'edit'
    end
  end

  # PATCH/PUT /events/1
  def cancel
    if @event.update(cancelled: params[:cancelled])
      if params[:cancelled] == "false"
        flash[:success] = I18n.t 'event_restored'
      else
        flash[:warning] = I18n.t 'event_cancelled'
      end
      redirect_to events_path
    else
      flash.now[:error] = I18n.t 'errors_abstract'
      render 'show'
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    flash[:warning] = I18n.t 'event_destroyed'
    redirect_to events_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(current_user.selected_venue)
    end
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:event_date, :event_time, :showings, :cancelled)
    end

    # Only venue owner or entry author can edit
    def check_ownership
      if !helpers.is_owner(@venue)
        flash[:error] = "Access denied!"
        redirect_to events_path
      end
    end
end
