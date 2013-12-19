class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :title
      t.text :description
      t.string :user_name
      t.timestamps
    end
  end
end
