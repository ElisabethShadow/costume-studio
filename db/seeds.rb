# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

# CATEGORIES = [ "Halloween", "Pirates", "Cowbow", "Carnival", "Monster", "Middle Age", "Superhero", "Fantasy", "Anime", "Strange", "Weird", "Super Weird", "Disgusting"]

# ID             0              1                   2                       3                       4                               5              6
FIRSTNAMES  = %w[Admin          Luka                Tom                     Hannelore               Hans-Peter                      Elisabeth      ABCDEFGHIJKLMNOPQRST]
LASTNAMES   = %w[Administer     Doncic              Jerry                   Mueller                 Robinson                        Windsor        ABCDEFGHIJKLMNOPQRST]
PASSWORDS   = %w[111111         111111              111111                  111111                  111111                          111111         111111 ]
EMAILS      = %w[admin@mail.com mvp.2021@dallas.com tomhatesjerry@mail.org  priority1@freemail.def  derrobinsonhans@hansepeter.com  me@queen.co.uk abcdefghijklmnopqrst@alphabet.com]

FIRSTNAMES.each_with_index do |firstname, index|
  User.create!(
  first_name: firstname,
  last_name: LASTNAMES[index],
  address: Faker::Address.full_address,
  email: EMAILS[index],
  password: PASSWORDS[index])
end

# =============================================================================

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

CATEGORIES = ["Weird","Halloween", "Disgusting", "Strange", "Weird", "Weird", "Monster", "Fantasy", "Monster", "Monster", "Weird", "Superhero"]

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
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622172629/Seeds%20-%20AirBnB/hlo4vozuchbqo7rbbq6z7ogambvp.png",
  "https://res.cloudinary.com/dmak3udzc/image/upload/v1622172631/Seeds%20-%20AirBnB/hui56x49whsww920p32zxje5s09q.png"
]

OWNERS = [
  User.find(2),
  User.find(2),
  User.find(2),
  User.find(3),
  User.find(4),
  User.find(4),
  User.find(2),
  User.find(3),
  User.find(1),
  User.find(3),
  User.find(1)
]

COSTUMENAMES.each_with_index do |name, index|
  costume = Costume.create!(
    user: OWNERS[index],
    name: name,
    size: SIZES[index],
    category: CATEGORIES[index],
    price: PRICES[index],
    description: DESCIPTIONS[index]
    )

    if IMAGES[index] != ""
      file = URI.open(IMAGES[index])
    else
      file = URI.open(IMAGES.last)
      costume.photo.attach(io: file, filename: name, content_type: 'image/jpg')
    end

end

COSTUME_ID = [1,2,3,4,5,6,7,8,9,10,11]
USER_ID = [3,4,5,1,1,5,3,4,5,2,3]

COSTUME_ID.each_with_index do |costume_id, index|
  Booking.create!(status: "pending", user: User.find(USER_ID[index]), costume: Costume.find(costume_id), check_in: "2021-05-1", check_out: "2021-05-3")
end
