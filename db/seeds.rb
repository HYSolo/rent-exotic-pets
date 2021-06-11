# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

User.delete_all
Pet.delete_all

puts 'Seeding main characters...'
# Create main users
joe_exotic = User.create!({
  name: 'Joe Exotic',
  email: 'joe@exotic.com',
  location: 'Oklahoma, USA',
  password: 'secret'
})
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/b/b1/Joe_Exotic_(Santa_Rose_County_Jail).png')
joe_exotic.photo.attach(io: file, filename: 'joe.png', content_type: 'image/png')

carole_baskin = User.create!({
  name: 'Carole Baskin',
  email: 'carole@baskin.com',
  location: 'Florida, USA',
  password: 'secret'
})
file = URI.open('https://imagesvc.meredithcorp.io/v3/mm/image?url=https:%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2020%2F09%2F08%2Fcarole-baskin-dwts.jpg')
carole_baskin.photo.attach(io: file, filename: 'carole.jpg', content_type: 'image/jpg')

david_attenborough = User.create!({
  name: 'David Attenborough',
  email: 'david@mail.com',
  location: 'London, UK',
  password: 'secret'
})
file = URI.open('https://ichef.bbci.co.uk/news/976/cpsprodpb/12D66/production/_114585177_attenborough1_pa.jpg')
david_attenborough.photo.attach(io: file, filename: 'david.jpg', content_type: 'image/jpg')

bindi_irwin = User.create!({
  name: 'Bindi Irwin',
  email: 'bindi@irwin.com',
  location: 'Beerwah, Queensland, Australia',
  password: 'secret'
})
file = URI.open('https://cdn.abcotvs.com/dip/images/1099475_082415-cc-dwts-stars-21-bindi.jpg?w=1280&r=16:9')
bindi_irwin.photo.attach(io: file, filename: 'bindi.jpg', content_type: 'image/jpg')

puts 'Seeing animals'
# Animals for Carol
tony_tiger = Pet.create!({
  name: 'Tony',
  description: 'Your favorite cereal-box tiger',
  species: 'Tiger',
  danger_meter: 1,
  price: 1000,
  address: 'New York, USA',
  user: carole_baskin
})
file = URI.open('https://popicon.life/wp-content/uploads/2019/01/169tonybanner.jpg')
file1 = URI.open('https://photo.kidzworld.com/images/2015107/313eae2a-390d-41e8-b7e0-d320920d1104/tony-the-tiger.jpg')
tony_tiger.photos.attach(io: file, filename: 'tony.jpg', content_type: 'image/jpg')
tony_tiger.photos.attach(io: file1, filename: 'tony1.jpg', content_type: 'image/jpg')


# Creating 5 pets that don't have any bookings
5.times do
  name = Faker::GreekPhilosophers.name
  description = Faker::Coffee.notes
  species = ['Alligator', "Tiger", "Lion", "Cheetah", "Bear"].sample
  danger_meter = rand(1..5)
  price = rand(100..1000)
  address = Faker::Address.city
  user = User.third
  pet = Pet.create!(name: name, description: description, species: species, danger_meter: danger_meter, price: price, address: address, user: user)
end

puts 'Creating bookings'
# #Creating 3 pets that *do* have bookings
5.times do
  name = Faker::GreekPhilosophers.name
  description = Faker::Coffee.notes
  species = ['Alligator', "Tiger", "Lion", "Cheetah", "Bear"].sample
  danger_meter = rand(1..5)
  price = rand(100..1000)
  address = Faker::Address.city
  user = User.all.second
  pet = Pet.create!(name: name, description: description, species: species, danger_meter: danger_meter, price: price, address: address, user: user)

  start_date = Faker::Date.in_date_period(year: 2021, month: 6)
  weeks = rand(1..10)
  end_date = start_date + (7 * weeks)
  total_price = price * weeks
  new_user = User.third
  booking = Booking.create!(start_date: start_date, end_date: end_date, total_price: total_price, user: new_user, pet: pet)
end

puts 'Seeding complete'
