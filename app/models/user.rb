class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :cars, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, :address, :email, :phone_number, presence: true
  validates :email, uniqueness: true
end
