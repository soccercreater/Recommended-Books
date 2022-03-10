class Post < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    belongs_to :user
    belongs_to :book

    validates :user_id, uniqueness: {scope: :book_id}
end
