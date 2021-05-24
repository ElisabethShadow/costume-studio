# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(first_name: "Dennis", last_name: "Rodman", address: "Chicago and Pyeongyang", email: 'dfsfsd@email.com', password: 'smith123')
costume = Costume.create!(name: 'Pumpkin Patch', size: 'Medium', category: 'Halloween', price: 20, description: 'Fun halloween costume', user: user)
Booking.create!(confirmation: true, user: user, costume: costume)
