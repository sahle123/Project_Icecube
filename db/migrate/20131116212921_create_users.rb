class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.datetime :birth_date
      t.string :status
      t.text :slogan
      t.integer :reputation

      t.timestamps
    end
  end
end
