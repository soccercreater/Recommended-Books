class Book < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

    has_many :assessments, dependent: :destroy
    has_many :posts, dependent: :destroy
    belongs_to :user

    has_one_attached :image

     validates :title, presence: true

    def self.search(keyword)
     where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
    end
end

