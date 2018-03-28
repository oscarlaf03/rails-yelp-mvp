require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating Restaurants'
50.times do
  Restaurant.new(
    name: Faker::Company.name +' '+Faker::Hipster.word +' '+Faker::Food.ingredient,
    address: Faker::Address.street_address + ' '+ Faker::Address.city + ' '+ Faker::Address.state +' ' + Faker::Address.country,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w[chinese italian japanese french belgian].sample
    ).save
end

puts 'Restaurants created succesfully'
random_restaurant_id = Restaurant.all.sample.id

=begin
puts 'Creating reviews'
50.times do
  a_review = Review.new(
    content: Faker::Movie.quote + 'with'+ Faker::Food.dish,
    rating: [0, 1, 2, 3, 4, 5].sample,
    ).save
  a_review.restaurant.id = Restaurant.all.sample.review
end
=end
puts 'Reviews created succesfully'
puts '*****************************'
puts 'Tasks completed'



