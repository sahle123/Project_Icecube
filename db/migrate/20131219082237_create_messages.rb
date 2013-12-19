class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :reciever
      t.string :subject
      t.string :content
      t.boolean :read
      t.timestamps
    end
  end
end
