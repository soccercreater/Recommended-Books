class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.string :body
      t.string :author
      t.integer :isbn
      t.date :publication_date
      t.string :book_genre
      t.string :book_image
    end
  end
end
