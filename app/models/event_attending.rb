class EventAttending < ApplicationRecord
  belongs_to :attendee
  belongs_to :atteneded_event
end
