class ChangeDatatypeOfQuestion < ActiveRecord::Migration
  def change
    change_column :emails, :question, :text
  end
end
