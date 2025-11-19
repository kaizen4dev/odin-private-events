class CreateEventAttendings < ActiveRecord::Migration[8.0]
  def change
    create_table :event_attendings do |t|
      t.belongs_to :attendee, null: false, foreign_key: { to_table: :users }
      t.belongs_to :attended_event, null: false, foreign_key: { to_table: :events }

      t.timestamps
    end
  end
end
