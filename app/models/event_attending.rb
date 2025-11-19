class EventAttending < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Event"

  validates :attendee_id, uniqueness: { message: "already joined this event", scope: [:attended_event_id] }
end
