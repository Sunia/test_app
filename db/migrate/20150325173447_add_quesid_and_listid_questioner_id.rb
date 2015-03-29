class AddQuesidAndListidQuestionerId < ActiveRecord::Migration
  def change
    add_column :emails, :question_id, :integer
    add_column :emails, :listener_id, :integer
    add_column :emails, :questioner_id, :integer
  end
end
