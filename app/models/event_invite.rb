class EventInvite < ApplicationRecord
  belongs_to :invite_event, class_name: "Event"
  belongs_to :invited_user, class_name: "User"

  validates :invited_user_id, uniqueness: { message: "is already in invite list", scope: [ :invite_event_id ] }
end
