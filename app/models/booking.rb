class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :user, :car, :start_time, :end_time, presence: true
end
