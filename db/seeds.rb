require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
  Restaurant.new(
    name: Faker::Company.name + Faker::Hipster.word + Faker::Food.ingredient,
    address: Faker::Address.street_address + Faker::Address.city + Faker::Address.state + Faker::Address.country,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w[chinese italian japanese french belgian].sample
    ).save
end

random_restaurant_id = Restaurant.all.sample.id


50.times do
  Review.new(
    content: Faker::Movie.quote + 'with'+ Faker::Food.description,
    rating: [0, 1, 2, 3, 4, 5].sample,
    resaurant_id: Restaurant.all.sample.id
    ).save
end
