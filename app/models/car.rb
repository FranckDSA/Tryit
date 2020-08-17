class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  CATEGORIES = ["family", "sports", "urban", "vintage"]
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not included in the list"}
end
