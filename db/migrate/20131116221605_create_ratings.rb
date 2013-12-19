class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :user_name
      t.integer :level_id
      t.integer :rating

      t.timestamps
    end
  end
end
