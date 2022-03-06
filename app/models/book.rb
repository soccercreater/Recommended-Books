class Book < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    belongs_to :user
    has_many :assessments, dependent: :destroy

    has_one_attached :image

    def self.search(keyword)
     where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
    end
end

