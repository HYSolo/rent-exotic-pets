# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Pet.delete_all

10.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  location = Faker::Address.city
  User.create!(name: name, email: email, password: "secret", location: location)
end

50.times do
  name = Faker::GreekPhilosophers.name
  description = Faker::Coffee.notes
  species = ['Alligator', "Tiger", "Lion", "Cheetah", "Bear"].sample
  danger_meter = rand(1..5)
  price = rand(100..1000)
  location = Faker::Address.city
  user = User.find(rand(1..10))
  pet = Pet.create!(name: name, description: description, species: species, danger_meter: danger_meter, price: price, location: location, user: user)
end