# This migration comes from action_mailbox (originally 20180917164000)
class CreateActionMailboxTables < ActiveRecord::Migration[5.2]
  def change
    create_table :action_mailbox_inbound_emails do |t|
      t.integer :status, default: 0, null: false
      t.string  :message_id

      t.datetime :created_at, precision: 6
      t.datetime :updated_at, precision: 6
    end
  end
end
