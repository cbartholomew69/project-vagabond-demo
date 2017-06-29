# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
User.destroy_all

user1 = User.create(email: 'default@askjeeves.com', password: 'default')
atlanta = City.create(id: 1, name: "Atlanta", photo: "http://i.imgur.com/WwnFRvM.jpg?2")
sf = City.create(id: 2, name: "San Francisco", photo: "https://media.collegetimes.com/uploads/2014/07/sf_trolley_alt.jpg")
london = City.create(id: 3, name: "London", photo: "https://cdn.londonandpartners.com/visit/london-organisations/tower-bridge/63730-640x360-tower-bridge-cam-640.jpg")
Post.create(title: "Atlanta Rocks", content: "Just visited Atlanta and had so much fun!", city_id: atlanta.id, user_id: user1.id, photo: "http://www.accessatlanta.com/rf/image_large/Pub/p7/AJC/2016/12/06/Images/newsEngin.17046227_091116RadarSkyline6.jpg")
Post.create(title: "Atlanta is hot", content: "Don't visit Atlanta in the summer time with a parka", city_id: atlanta.id, user_id: user1.id, photo: "https://cdn.dribbble.com/users/5637/screenshots/1275438/hotlanta_1x.jpg")
Post.create(title: "Atlanta has a great number of venues", content: "You have to check out the fox theater", city_id: atlanta.id, user_id: user1.id, photo: "http://www.olympiaentertainment.com/assets/img/Fox-Theatre-Orchestra.jpg")

Post.create(title: "West London", content: "West London is a place for theatre", city_id: london.id, user_id: user1.id, photo: "http://www.urban75.org/london/images/leicester-square-09.jpg")
Post.create(title: "Manchester London", content: "Manchester is known throughout the world for its variety of exciting activities. Its influence is particularly notable artistically, architecturally, theatrically and musically, helping to make it a 'top 10 city in the world to visit.", city_id: london.id, user_id: user1.id, photo: "http://www.intostudy.com/Portals/2/ImagesINTO/MAN/City/INTO-Manchester-city-canal.jpg")
Post.create(title: "Liverpool", content: "Gave the world The Beatles, something we'll always be grateful ford!", city_id: london.id, user_id: user1.id, photo: "http://www.blogcdn.com/travel.aol.co.uk/media/2011/11/liv1.jpg")
Post.create(title: "San Francisco Crimson Bridge", content: "Crimson bridge, cable cars, a sparkling bay, and streets lined with elegant Victorian homes—San Francisco is undeniably one of the world’s great cities.", city_id: sf.id, user_id: user1.id, photo: "http://www.visitcalifornia.com/sites/default/files/styles/welcome_image/public/VCW_TI_5_BayLoop_Hero_Manley_1280x642_sized_0.jpg")
Post.create(title: "San Francisco Warf", content: "Explore the quaint neighborhoods, hilly streets, and historic architecture sprinkled throughout vibrant San Francisco. Get up-close looks at local-packed parks, snap photos of boats bobbing along the waterfront.", city_id: sf.id, user_id: user1.id, photo: "https://a.travel-assets.com/mediavault.le/media/d926bf342cb954b2ecc8d2ef720044958fc38eb0.jpeg")
Post.create(title: "San Francisco Lombard Street", content: "The city of San Francisco is constructed upon hilly lands, with ups and downs at every corner of the street. Interesting fact, when you park cars on the steps of a rising of falling hillside, you would have to turn your front wheels inwards or outwards according to the side of the hill so your car wouldn’t slide off steep slopes.
            Lombard street, in this case, is an especially steep slope. Evidently, cars would certainly have difficulty if the street is a one-way down with no twists and turns; it would most likely be a very bumpy real life 70-degree rollercoaster. Regardless, the twists and turns of Lombard street makes the location an attractive landmark exclusive to the hilly sides of San Francisco,
              and is definitely worth a drive down the road if you’re up for it.", city_id: sf.id, user_id: user1.id, photo: "https://s-media-cache-ak0.pinimg.com/originals/84/88/0e/84880e1b63e805731157095979fa8658.jpg")
puts "created seeds"
