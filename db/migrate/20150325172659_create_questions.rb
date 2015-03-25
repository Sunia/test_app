class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description, null: false, default: ""
      t.timestamps null: false
    end
  end
end
