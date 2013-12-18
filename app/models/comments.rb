class Comments < ActiveRecord::Base
	belongs_to :level
	validates :user_id, presence: true
	def change
    create_table :comments do |t|
      t.string :description
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
  end
end
