class CreateAssessments < ActiveRecord::Migration[6.1]
  def change
    create_table :assessments do |t|
      t.integer :user_id
      t.integer :book_id
      t.float :star
      t.text :comment
      t.timestamps
    end
  end
end
