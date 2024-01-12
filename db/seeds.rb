# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning database...'
# Offer.destroy_all # this line do not reset the id numbers
Offer.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('offers')

puts 'Creating 5 offers ...'
5.times do |i|
  offer = Offer.create!(
    title: Faker::Fantasy::Tolkien.location,
    description: Faker::Fantasy::Tolkien.poem,
    price: 99.9,
    number_of_guests: 8,
    address: Faker::Address.full_address
  )
  puts "#{i + 1}. #{offer.title}"
end

puts 'Finished!'
