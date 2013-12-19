class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_name
      t.integer :update_id
      t.integer :level_id
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
