class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :user_name
      t.integer :level_id
      t.integer :score

      t.timestamps
    end
  end
end
