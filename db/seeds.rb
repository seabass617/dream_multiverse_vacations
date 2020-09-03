# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

puts "destroying all users and dimensions..."
User.destroy_all
Dimension.destroy_all

puts "Instances destroyed... Creating new Users..."

user_rick = User.new
user_rick.email = 'rick@c137.com'
user_rick.first_name = "Rick"
user_rick.last_name = "Sanchez"
user_rick.password = '123456'
user_rick.password_confirmation = '123456'
user_rick.bio = "I'm doing the science thing...but let's face it I'm probably succumbing to...alll-*buuurp*coholism"
# user_rick.photo = 'https://banner2.cleanpng.com/20190111/fci/kisspng-rick-sanchez-clip-art-telegram-illustration-sticke-telegram-ampq-5c38a02c3ff6e4.644130331547214892262.jpg'
user_rick.save!


user_morty = User.new
user_morty.email = 'morty@c137.com'
user_morty.first_name = "Morty"
user_morty.last_name = "Smith"
user_morty.password = '123456'
user_morty.password_confirmation = '123456'
user_morty.bio = "Awe jeez rick I don't know."
# user_morty.photo = 'https://img2.gratispng.com/20180806/vws/kisspng-snout-clip-art-sticker-forehead-sticker-telegram-snout-clip-art-others-512-512-t-5b690d719335d4.319521641533611377603.jpg'
user_morty.save!


user_beth = User.new
user_beth.email = 'beth@gmail.com'
user_beth.first_name = "Beth"
user_beth.last_name = "Smith"
user_beth.password = '123456'
user_beth.password_confirmation = '123456'
user_beth.bio = "My dad is a scientist❤️my husband is hard work❤️favourite thing is wine🍷🍷REAL surgeon 🐴"
# user_beth.photo = 'https://vignette.wikia.nocookie.net/ipdkverse/images/c/cb/Beth_Smith_1.png/revision/latest?cb=20190925220530'
user_beth.save!


user_summer = User.new
user_summer.email = 'summer@gmail.com'
user_summer.first_name = "Summer"
user_summer.last_name = "Smith"
user_summer.password = '123456'
user_summer.password_confirmation = '123456'
user_summer.bio = "boo-yah!!!"
# user_summer.photo = 'https://n7.nextpng.com/sticker-png/356/323/sticker-png-rick-sanchez-morty-smith-summer-smith-pocket-mortys-character-bolsonaro-purple-child-face-violet.png'
user_summer.save!


user_jerry = User.new
user_jerry.email = 'jerry@aol.com'
user_jerry.first_name = "Jerry"
user_jerry.last_name = "Smith"
user_jerry.password = '123456'
user_jerry.password_confirmation = '123456'
user_jerry.bio = "Life Is Effort ..."
# user_jerry.photo = 'https://www.pngfind.com/pngs/m/344-3446247_rick-and-morty-clipart-jerry-jerry-rick-and.png'
user_jerry.save!

puts "users created... scraping for dimensions..."

url = "https://rickandmorty.fandom.com/wiki/Category:Dimensions"
html = Nokogiri::HTML(open(url).read)
dimensions = []


html.search(".category-page__member-link").each do |e|
  
  dimension_page = URI.encode("https://rickandmorty.fandom.com/wiki/#{e.text.strip}")

  if Nokogiri::HTML(open(dimension_page).read).at(".pi-image-thumbnail").nil?
    images_url = ""
  else
    images_url = Nokogiri::HTML(open(dimension_page).read).at(".pi-image-thumbnail")['src']
  end

  if Nokogiri::HTML(open(dimension_page).read).at(".pi-data-value.pi-font").nil?
    dimension_description = ""
  else
    dimension_description = Nokogiri::HTML(open(dimension_page).read).at(".pi-data-value.pi-font").text.strip
  end

  Dimension.create!(
    name: e.text.strip,
    photo: images_url,
    description: dimension_description,
    user_id: User.all.sample.id
  )
end
puts "all set"
