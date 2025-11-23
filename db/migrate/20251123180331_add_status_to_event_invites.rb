class AddStatusToEventInvites < ActiveRecord::Migration[8.0]
  def change
    add_column :event_invites, :status, :integer, default: 0
  end
end
