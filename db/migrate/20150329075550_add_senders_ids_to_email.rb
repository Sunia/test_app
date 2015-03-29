class AddSendersIdsToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :sender_ids, :string, array: true, default: []
  end
end
