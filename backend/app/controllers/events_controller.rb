class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :get_user

  # GET /events
  def index
    @events = @user.events

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  def get_events(from_date, to_date)
    @events = Event.where("created_at BETWEEN ? and ?", from_date,to_date)

    render json: @events
  end

  private
    def get_user
      @user = User.find(params[:user_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:title, :starttime, :endtime, :description, :rsvp, :allday, :user_id)
    end
end
