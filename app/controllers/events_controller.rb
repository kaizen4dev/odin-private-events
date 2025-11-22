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

  def edit
    @event = Event.find params[:id]

    if @event.creator_id != current_user.id
      redirect_back fallback_location: root_path, notice: "You can't edit this event."
      return
    end
  end

  def update
    @event = Event.find params[:id]

    return render :edit, status: :forbidden unless @event.creator_id == current_user.id

    if @event.update(event_params)
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find params[:id]

    if @event.creator_id != current_user.id
      redirect_back fallback_location: root_path, status: :forbidden, notice: "You can't delete this event."
      return
    end

    @event.destroy
    redirect_back fallback_location: root_path, notice: "You deleted an event."
  end

  private

  def event_params
    params.expect event: [ :name, :time, :location ]
  end
end
