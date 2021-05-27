# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

# CATEGORIES = [ "Halloween", "Pirates", "Cowbow", "Carnival", "Monster", "Middle Age", "Superhero", "Fantasy", "Anime", "Strange", "Weird", "Super Weird", "Disgusting"]

# ID             1              2                   3                       4                       5                               6              7
FIRSTNAMES  = %w[Admin          Luka                Tom                     Hannelore               Hans-Peter                      Elisabeth      ABCDEFGHIJKLMNOPQRST]
LASTNAMES   = %w[Administer     Doncic              Jerry                   Mueller                 Robinson                        Windsor        ABCDEFGHIJKLMNOPQRST]
PASSWORDS   = %w[111111         111111              111111                  111111                  111111                          111111         111111 ]
EMAILS      = %w[admin@mail.com mvp.2021@dallas.com tomhatesjerry@mail.org  priority1@freemail.def  derrobinsonhans@hansepeter.com  me@queen.co.uk abcdefghijklmnopqrst@alphabet.com]


COSTUMENAMES = [
  "Big Bird",
  "American Tourist Tropical",
  "Portable silver toilet",
  "Running Nose",
  "The Finger",
  "Dictator Coding Kim Jong-Un",
  "Bigfoot and Toehairs",
  "Fancy Shrek",
  "Donald Cunt",
  "Jager Bomber",
  "The Berliner"
]

SIZES = ["M", "XL", "L", "M", "180", "180", "L", "420", "420", "420", "180", "180"]

PRICES = [82.99, 45.99, 20.0, 96.0, 20.49, 100000, 101.25, 50.0, 0.01, 111, 69]

CATEGORIES = ["Weird","Halloween", "Disgusting Rental", "Strange", "Weird", "Weird", "Monster", "Fantasy", "Monster", "Monster", "Weird", "Superhero"]

DESCIPTIONS = [
  "Relive your favorite Seasame Street memories in this feathery madness!",
  "Transport to a tropical island by dressing up in this fun, tourist costume! Package includes a visor, sunglasses, coconut drink, tshirt and shorts.",
  "Ever wanted to know what it feels like to be a toilet? Sparkle and dazzle in this silver number.",
  "Can you beat a running nose?",
  "Description: When you hate everyone and everything !",
  "Description: Just be a bad person one time in your life",
  "This is a left foot. Does not come with right foot. NO REFUNDS!!!",
  "You want to look fancy and nice for a day ? Don't hesistate with the Fancy Shrek !",
  "You want to be a cunt ? Just rent the Donald Cunt and fuck the world for a night or day. !",
  "Just spread love & Jager bombs",
  "Description: Perfect for your sunday afternoon..."
]

IMAGES = [
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622037466/u3j0fnb1ejgakxzdpoz9f6j7t1r0.jpg",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622037777/58p7sfrg8oqsh8jg8f9wonubhb56.jpg",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622037851/lwe6lbgou76qsb80mbxdfvxjblim.jpg",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622038117/xbetew5grasklxih06b3gvml1d7e.jpg",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622038169/79f8w855huw3lkllfb89rdihhcp5.png",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622038349/ux733o6dvk43kaf4ox6chf2b5uoh.png",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622038398/xhdbaafmun3qecxdjd09k32u7569.jpg",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622038717/j5l28w63t8c8uxbdyp8dh3rgt4hu.png",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622038910/n7qpmby1j13bln3vcvkepq1mwo1t.png",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622039373/vwwlje8pd4dgcefsb89sbjlgosqj.png",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622037858/z2a7tjukioe0vx9g8l0ilui52s3z.png"
]


FIRSTNAMES.each_with_index do |firstname, index|
  User.create!(
  first_name: firstname,
  last_name: LASTNAMES[index],
  address: Faker::Address.full_address,
  email: EMAILS[index],
  password: PASSWORDS[index])
end


USERS = [
  User.find(2),
  User.find(2),
  User.find(2),
  User.find(3),
  User.find(4),
  User.find(4),
  User.find(2),
  User.find(3),
  User.find(5),
]

COSTUMENAMES.each_with_index do |name, index|
  costume = Costume.create!(
    name: name,
    size: SIZES[index],
    category: CATEGORIES[index],
    price: PRICES[index],
    description: DESCIPTIONS[index]
    )

    file = URI.open(IMAGES[index])
    costume.photo.attach(io: file, filename: name, content_type: 'image/jpg')
end


# person1 = User.create!(
#   first_name: "Luka", last_name: "Doncic",
#   address: "Dallas, Lucas Oil Stadium", email: "mvp.2021@dallas.com",
#   password: 111111)


#1 of Doncic
# costume1 = Costume.create!(
#     name: Faker::Games::SuperSmashBros.fighter,
#     size: %w[XS, S, M, L, XL, XXL].sample,
#     category: Costume.categories.sample,
#     price: Faker::Number.between(from: 0.00, to: 200.00).round(2),
#     description: Faker::TvShows::SouthPark.quote,
#     user: person1)

# file = URI.open('https://picsum.photos/200/300?random=1')
# costume1.photo.attach(io: file, filename: Faker::Games::SuperSmashBros.stage, content_type: 'image/jpg')

# #1 of Doncic
# costume2 = Costume.create!(
#     name: Faker::Games::SuperSmashBros.fighter,
#     size: %w[XS, S, M, L, XL, XXL].sample,
#     category: Costume.categories.sample,
#     price: Faker::Number.between(from: 0.00, to: 200.00).round(2),
#     description: Faker::TvShows::SouthPark.quote,
#     user: person1)

# file = URI.open('https://picsum.photos/200/300?random=1')
# costume2.photo.attach(io: file, filename: Faker::Games::SuperSmashBros.stage, content_type: 'image/jpg')

# # random

# 5.times do
# User.create!(
#   first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
#   address: Faker::Address.full_address, email: Faker::Internet.email,
#   password: Faker::Internet.password)
# end


# 7.times do
#   costume = Costume.create!(
#     name: Faker::Games::SuperSmashBros.fighter,
#     size: %w[XS, S, M, L, XL, XXL].sample,
#     category: Costume.categories.sample,
#     price: Faker::Number.between(from: 0.00, to: 200.00).round(2),
#     description: Faker::TvShows::SouthPark.quote,
#     user: User.all.sample)

#   file = URI.open('https://picsum.photos/200/300?random=1')
#   costume.photo.attach(io: file, filename: Faker::Games::SuperSmashBros.stage, content_type: 'image/jpg')
# end

# Costume.all.sample(4).each_with_index do |costume, index|
#   user = User.all.sample
#   confirmation = index%4 == 0 ? true : false
#   Booking.create!(confirmation: confirmation, user: user, costume: costume)
# end


# Booking.create!(confirmation: false, user: User.find(2), costume: costume1, check_in: "2021-05-1", check_out: "2021-05-3")
# Booking.create!(confirmation: false, user: User.find(3), costume: costume2,  check_in: "2021-05-1", check_out: "2021-05-3")
# Booking.create!(confirmation: true, user: User.find(4), costume: costume1,  check_in: "2021-06-1", check_out: "2021-06-3")
# Booking.create!(confirmation: false, user: person1, costume: Costume.find(4),  check_in: "2021-05-1", check_out: "2022-05-3")
# Booking.create!(confirmation: true, user: person1, costume: Costume.find(5),  check_in: "2022-01-1", check_out: "2022-01-30")


