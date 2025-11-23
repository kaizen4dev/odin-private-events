class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendings, foreign_key: "attended_event_id"
  has_many :attendees, through: :event_attendings
  has_many :event_invites, foreign_key: "invite_event_id"

  default_scope {order :time}

  current_time = Time.now.strftime "%Y-%m-%dT%T" # using default time format of datatime_field
  scope :past, -> { where "time < ?", [ current_time ] }
  scope :upcoming, -> { where "time > ?", [ current_time ] }

  enum :visibility, { public: 0, private: 1 }, suffix: true
end
