class EventAttendingsController < ApplicationController
  def create
    @event_attending = EventAttending.build attendee_id: params[:user_id], attended_event_id: params[:event_id]

    if @event_attending.save
      redirect_back fallback_location: root_path, notice: "You joined the event!"
    end
  end

  def destroy
    @event_attending = EventAttending.find [params[:user_id], params[:event_id]]
    @event_attending.destroy
    redirect_back fallback_location: root_path, notice: "You left the event."
  end
end
