# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Pet.delete_all

# Creating 10 users
10.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  location = Faker::Address.city
  User.create!(name: name, email: email, password: "secret", location: location)
end

# Creating 20 pets that don't have any bookings
20.times do
  name = Faker::GreekPhilosophers.name
  description = Faker::Coffee.notes
  species = ['Alligator', "Tiger", "Lion", "Cheetah", "Bear"].sample
  danger_meter = rand(1..5)
  price = rand(100..1000)
  address = Faker::Address.city
  user = User.all.sample
  pet = Pet.create!(name: name, description: description, species: species, danger_meter: danger_meter, price: price, address: address, user: user)
end

#Creating 20 pets that *do* have bookings
20.times do
  name = Faker::GreekPhilosophers.name
  description = Faker::Coffee.notes
  species = ['Alligator', "Tiger", "Lion", "Cheetah", "Bear"].sample
  danger_meter = rand(1..5)
  price = rand(100..1000)
  address = Faker::Address.city
  user = User.all.sample
  pet = Pet.create!(name: name, description: description, species: species, danger_meter: danger_meter, price: price, address: address, user: user)
  
  start_date = Faker::Date.in_date_period(year: 2021, month: 6)
  weeks = rand(1..10)
  end_date = start_date + (7 * weeks)
  total_price = price * weeks
  if user == User.first
    new_user = User.last
  else
    new_user = User.find(user.id - 1)
  end
  booking = Booking.create!(start_date: start_date, end_date: end_date, total_price: total_price, user: new_user, pet: pet)
end