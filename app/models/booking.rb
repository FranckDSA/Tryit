class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :user, :car, :start_time, :end_time, presence: true

  def price
    @book_hours = ((self.end_time - self.start_time) / 3600).round
    @price = @book_hours * self.car.daily_rent_price
    return @price
  end
end
