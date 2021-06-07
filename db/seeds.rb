# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: "sample@gmail.com", password: "secret")

pet = Pet.create!(name: "aligator", description: "its an aligator", species: "reptile", danger_meter: 10, price: 100000, location: "Boston", user: user)