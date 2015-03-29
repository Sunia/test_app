class RenameQuesIdToQues < ActiveRecord::Migration
  def change
    rename_column :emails, :question_id, :question
  end
end
