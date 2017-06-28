# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
City.create(id: 1, name: "Atlanta", photo: 'http://i.huffpost.com/gen/1716876/images/o-ATLANTA-TRAFFIC-facebook.jpg')
Post.create(title: "Atlanta Rocks", content: "Just visited Atlanta and had so much fun!", city_id: 1, user_id: 1, photo: "http://www.accessatlanta.com/rf/image_large/Pub/p7/AJC/2016/12/06/Images/newsEngin.17046227_091116RadarSkyline6.jpg")
Post.create(title: "Atlanta is hot", content: "Don't visit Atlanta in the summer time with a parka", city_id: 1, user_id: 1, photo: "https://cdn.dribbble.com/users/5637/screenshots/1275438/hotlanta_1x.jpg")
Post.create(title: "Atlanta has a great number of venues", content: "You have to check out the fox theater", city_id: 1, user_id: 2, photo: "http://www.olympiaentertainment.com/assets/img/Fox-Theatre-Orchestra.jpg")

puts "created seeds"
