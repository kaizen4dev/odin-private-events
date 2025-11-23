class CreateEventInvites < ActiveRecord::Migration[8.0]
  def change
    create_table :event_invites do |t|
      t.references :invite_event, null: false, foreign_key: { to_table: :events }
      t.references :invited_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
