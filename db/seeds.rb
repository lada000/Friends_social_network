# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
categories = [
  "Football", "Movies", "Music", "Travel", "Books",
  "Gaming", "Cooking", "Photography", "Art", "Fitness",
  "Cycling", "Swimming", "Yoga", "Technology", "Science",
  "History", "Nature", "Pets", "Dancing", "Running",
  "Crafting", "Hiking", "Gardening", "Fishing", "Skiing",
  "Snowboarding", "Martial Arts", "Theater", "Writing", "Languages",
  "Fashion", "Astronomy", "Politics", "Economics", "Meditation",
  "Health", "Comedy", "Podcasts", "DIY Projects", "Board Games"
]

categories.each_with_index do |category_name, index|
  Category.upsert({ id: index + 1, name: category_name }, unique_by: :id)
end
