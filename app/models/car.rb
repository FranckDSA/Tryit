class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  has_many   :reviews,  through: :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORIES = ["Family", "Sports", "Urban", "Vintage", "Exotic"]
  validates :category, inclusion: { in: CATEGORIES, message: "%{value} is not included in the list"}
end
