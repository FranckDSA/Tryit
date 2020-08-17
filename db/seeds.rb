# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Thierry", last_name: "Boulot", address: "14 rue de la république, Paris", phone_number: "0633967272", email: "t.boulot@gmail.com")
Car.create(category: "family", brand: "Renault", model: "Scenic", motorizing: "2.0 DCi", description: "Un véhicule de qualité.", user_id: 1)
