# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

# CATEGORIES = [ "Halloween", "Pirates", "Cowbow", "Carnival", "Monster", "Middle Age", "Superhero", "Fantasy", "Anime", "Strange", "Weird", "Super Weird", "Disgusting"]


5.times do
User.create!(
  first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
  address: Faker::Address.full_address, email: Faker::Internet.email,
  password: Faker::Internet.password)
end

7.times do
  costume = Costume.create!(
    name: Faker::Games::SuperSmashBros.fighter,
    size: %w[XS, S, M, L, XL, XXL].sample,
    category: Costume.categories.sample,
    price: Faker::Number.between(from: 0.00, to: 200.00).round(2),
    description: Faker::TvShows::SouthPark.quote,
    user: User.all.sample)

  file = URI.open('https://picsum.photos/200/300?random=1')
  costume.photo.attach(io: file, filename: Faker::Games::SuperSmashBros.stage, content_type: 'image/jpg')
end

Costume.all.sample(4).each_with_index do |costume, index|
  user = User.all.sample
  confirmation = index%4 == 0 ? true : false
  Booking.create!(confirmation: confirmation, user: user, costume: costume)
end

