# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'date'

Faker::Config.locale = :fr

Car.destroy_all
User.destroy_all
Booking.destroy_all

CATEGORIES = ["family", "sports", "urban", "vintage"]

10.times do

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user_name = "#{first_name.downcase}_#{last_name.downcase}"

  user = User.new(
    first_name: first_name,
    last_name: last_name,
    username: user_name,
    phone_number: Faker::PhoneNumber.phone_number,
    email: "#{first_name.downcase}.#{last_name.downcase}@gmail.com",
    address: Faker::Address.full_address,
    password: '123456'
  )

  p Faker::Avatar.image
  file = URI.open("#{Faker::Avatar.image}.jpg")

  user.photo.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')
  user.save!


  car = Car.new(
      category: CATEGORIES.sample,
      brand: Faker::Vehicle.make,
      model: Faker::Vehicle.model(make_of_model: :brand),
      motorizing: Faker::Vehicle.engine,
      description:Faker::Vehicle.standard_specs,
      start_date: Date.now,
      end_date: Faker::Date.forward(days: 23),
      user_id: user.id
  )

  file_car = URI.open('https://source.unsplash.com/800x450/?car')
  car.photo.attach(io: file_car, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

end
