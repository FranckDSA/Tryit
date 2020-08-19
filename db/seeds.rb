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

categories = ["Family", "Sports", "Urban", "Vintage", "Exotic"]

addresses = [
"14 Rue Fagon, 75013 Paris",
"16 Villa Gaudelet, 75011 Paris",
"Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
"24 Rue du Commandant Guilbaud, 75016 Paris",
"Rue de Rivoli, 75001 Paris",
"47 Rue de Babylone, 75007 Paris",
"13 Avenue du Président Wilson, 75116 Paris",
"158 Boulevard Haussmann, 75008 Paris",
"35 Rue du Chevalier de la Barre, 75018 Paris",
"200 Quai de Valmy, 75010 Paris",
"47 Rue des Couronnes, 75020 Paris",
"38 Rue Saint-Maur, 75011 Paris",
"Place de la Nation, 75011 Paris",
"Place du Panthéon, 75005 Paris",
"Avenue de Paris, 94300 Vincennes"
]


# A MODIFIER AVEC LE VRAI SEED!!!!!!!!!!!!!!!!

12.times do

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user_name = "#{first_name.gsub(/\s+/, "").downcase}_#{last_name.gsub(/\s+/, "").downcase}"

  p user = User.new(
    first_name: first_name || 'jean',
    last_name: last_name || 'michel',
    username: user_name,
    phone_number: Faker::PhoneNumber.phone_number,
    email: "#{first_name.gsub(/\s+/, "").downcase}.#{last_name.gsub(/\s+/, "").downcase}@gmail.com",
    password: '123456'
  )

  file = URI.open(Faker::Avatar.image)

  user.photo.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')
  user.save!

  brand = Faker::Vehicle.make

  p car = Car.new(
      category: "Sports",
      brand: brand,
      model: Faker::Vehicle.model(make_of_model: brand),
      motorizing: Faker::Vehicle.engine,
      description:Faker::Vehicle.standard_specs.join(" | "),
      address: addresses[0],
      start_date: Date.new,
      end_date: Faker::Date.forward(days: 23),
      user_id: user.id
  )

  addresses.delete_at(0)

  file_car1 = URI.open('https://source.unsplash.com/800x450/?car')
  car.photos.attach(io: file_car1, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  file_car2 = URI.open('https://source.unsplash.com/800x450/?auto')
  car.photos.attach(io: file_car2, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  file_car3 = URI.open('https://source.unsplash.com/800x450/?voiture')
  car.photos.attach(io: file_car3, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  file_car4 = URI.open('https://source.unsplash.com/800x450/?road')
  car.photos.attach(io: file_car4, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  file_car5 = URI.open('https://source.unsplash.com/800x450/?garage')
  car.photos.attach(io: file_car5, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!
end

# categories.each do |category|

# 3.times do

#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   user_name = "#{first_name.gsub(/\s+/, "").downcase}_#{last_name.gsub(/\s+/, "").downcase}"

#   p user = User.new(
#     first_name: first_name || 'jean',
#     last_name: last_name || 'michel',
#     username: user_name,
#     phone_number: Faker::PhoneNumber.phone_number,
#     email: "#{first_name.gsub(/\s+/, "").downcase}.#{last_name.gsub(/\s+/, "").downcase}@gmail.com",
#     password: '123456'
#   )

#   file = URI.open(Faker::Avatar.image)

#   user.photo.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')
#   user.save!

#   brand = Faker::Vehicle.make

#   p car = Car.new(
#       category: category,
#       brand: brand,
#       model: Faker::Vehicle.model(make_of_model: brand),
#       motorizing: Faker::Vehicle.engine,
#       description:Faker::Vehicle.standard_specs.join(" | "),
#       address: addresses[0],
#       start_date: Date.new,
#       end_date: Faker::Date.forward(days: 23),
#       user_id: user.id
#   )

#   addresses.delete_at(0)

#   file_car1 = URI.open('https://source.unsplash.com/800x450/?car')
#   car.photos.attach(io: file_car1, filename: 'car.jpg', content_type: 'image/jpg')
#   car.save!

#   file_car2 = URI.open('https://source.unsplash.com/800x450/?auto')
#   car.photos.attach(io: file_car2, filename: 'car.jpg', content_type: 'image/jpg')
#   car.save!

#   file_car3 = URI.open('https://source.unsplash.com/800x450/?voiture')
#   car.photos.attach(io: file_car3, filename: 'car.jpg', content_type: 'image/jpg')
#   car.save!

#   file_car4 = URI.open('https://source.unsplash.com/800x450/?road')
#   car.photos.attach(io: file_car4, filename: 'car.jpg', content_type: 'image/jpg')
#   car.save!

#   file_car5 = URI.open('https://source.unsplash.com/800x450/?garage')
#   car.photos.attach(io: file_car5, filename: 'car.jpg', content_type: 'image/jpg')
#   car.save!
# end
# end


