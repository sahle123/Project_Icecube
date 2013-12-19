class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :user_name
      t.integer :avg_rating
      t.string :title
      t.text :description
      t.integer :restriction_move
			t.integer :restriction_time
      t.text :level_string
      t.timestamps
    end
  end
end
