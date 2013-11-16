class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :level_ID
      t.string :user_name
      t.integer :avg_rating
      t.string :title
      t.text :description
      t.string :type
      t.integer :restriction
      t.text :level_string

      t.timestamps
    end
  end
end
