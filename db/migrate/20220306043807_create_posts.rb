class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :reason
      t.timestamps
    end
  end
end
