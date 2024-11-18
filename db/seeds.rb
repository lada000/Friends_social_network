require 'faker'

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

categories = Category.all.to_a

if categories.empty?
  puts "No categories found. Run `rails db:seed` to create categories first."
  exit
end

100.times do |i|
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    status: [true, false].sample, 
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )

  user.categories << categories.sample(rand(5..10))
end
