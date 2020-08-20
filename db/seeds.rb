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

puts "Destroying tables..."

Car.destroy_all
User.destroy_all
Booking.destroy_all

puts "Starting a new game..."

categories = ["Family", "Sports", "Urban", "Vintage", "Exotic"]

addresses = [
"14 Rue Fagon, 75013 Paris",
"16 Villa Gaudelet, 75011 Paris",
"5 Avenue Anatole France, 75007 Paris",
"24 Rue du Commandant Guilbaud, 75016 Paris",
"12 Rue de Rivoli, 75001 Paris",
"47 Rue de Babylone, 75007 Paris",
"13 Avenue du Président Wilson, 75116 Paris",
"158 Boulevard Haussmann, 75008 Paris",
"35 Rue du Chevalier de la Barre, 75018 Paris",
"200 Quai de Valmy, 75010 Paris",
"47 Rue des Couronnes, 75020 Paris",
"38 Rue Saint-Maur, 75011 Paris",
"Place de la Nation, 75011 Paris",
"Place du Panthéon, 75005 Paris",
"Avenue de Paris, 94300 Vincennes",
"10 Boulevard Montmartre, 75009 Paris",
"1 Avenue Claude Vellefaux, 75010 Paris",
"48 Bd Sérurier, 75019 Paris",
"200 Quai de Valmy, 75010 Paris",
"53 Avenue des Terroirs de France, 75012 Paris",
"5 Rue Thomas Mann, 75013 Paris",
"15 Avenue de Choisy, 75013 Paris",
"61 Rue de l'Amiral Mouchez, 75013 Paris",
"2 Place Jacques Marette, 75015 Paris",
"18 Rue de Paradis, 75010 Paris",
"53 Rue de la Saussière, 92100 Boulogne-Billancourt",
"2 Rue Louis Boilly, 75016 Paris",
"75 Avenue des Champs-Élysées, 75008 Paris",
"16 Rue Chaptal, 75009 Paris",
"14 Bis Rue Sainte-Isaure, 75018 Paris",
"27 Boulevard de la Villette, 75010 Paris",
"20 Cour des Petites Écuries, 75010 Paris",
"49 Rue de la Folie Méricourt, 75011 Paris",
"Square de la Tour Saint-Jacques, 75004 Paris",
"34 Quai d'Austerlitz, 75013 Paris",
"8 Boulevard du Palais, 75001 Paris",
"Place Charles de Gaulle, 75008 Paris",
"47 Rue de Ponthieu, 75008 Paris",
"19 Boulevard de la Tour-Maubourg, 75007 Paris",
"13 Rue Bosio, 75016 Paris",
"75 Avenue Jean Baptiste Clement, 92100 Boulogne-Billancourt",
"136 Avenue Félix Faure, 75015 Paris",
"46 Boulevard du Montparnasse, 75015 Paris",
"139 Boulevard de Grenelle, 75015 Paris",
"47 Rue des Couronnes, 75020 Paris"
]


categories.each do |category|

3.times do

  puts "Je demande un P..."

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user_name = "#{first_name.gsub(/\s+/, "").downcase}_#{last_name.gsub(/\s+/, "").downcase}"

  user = User.new(
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

  puts "Je demande un A..."

  brand = Faker::Vehicle.make

  puts "... et je crée une nouvelle voiture : #{brand}"

  price = rand(10000...50000)

  car = Car.new(
      category: category,
      brand: brand,
      model: Faker::Vehicle.model(make_of_model: brand),
      motorizing: Faker::Vehicle.engine,
      description:Faker::Vehicle.standard_specs.join(" | "),
      address: addresses[0],
      start_date: Date.new,
      end_date: Faker::Date.forward(days: 23),
      user_id: user.id,
      sell_price: price,
      daily_rent_price: (price*0.005).round
  )

  addresses.delete_at(0)

  puts "Je demande un R..."

  file_car1 = URI.open('https://source.unsplash.com/800x450/?car')
  car.photos.attach(io: file_car1, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  puts "Je demande un I..."

  file_car2 = URI.open('https://source.unsplash.com/800x450/?auto')
  car.photos.attach(io: file_car2, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  puts "Je demande un S..."

  file_car3 = URI.open('https://source.unsplash.com/800x450/?voiture')
  car.photos.attach(io: file_car3, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  puts "PARIS"

  file_car4 = URI.open('https://source.unsplash.com/800x450/?road')
  car.photos.attach(io: file_car4, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  puts "PARIS"

  file_car5 = URI.open('https://source.unsplash.com/800x450/?garage')
  car.photos.attach(io: file_car5, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  puts "PARIS! oui monsieur!"
  end
end


