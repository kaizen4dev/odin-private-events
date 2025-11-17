class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build event_params

    if @event.save
      redirect_to user_path current_user.id
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find params[:id]
  end

  private

  def event_params
    params.expect event: [:name, :time, :location]
  end
end
