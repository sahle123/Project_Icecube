class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :user_name
			t.string :password_digest
      t.string :email
      t.datetime :birth_date
      t.text :slogan
      t.integer :reputation
			t.boolean :mod
      t.timestamps
    end
  end
end
