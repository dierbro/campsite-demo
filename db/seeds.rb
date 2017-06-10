# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Campsite
campsite = Campsite.create(name: "FunCamp")

# Create Activities
activities = %w/A B C/.map{ |l| campsite.activities.create(name: "Activity#{l}") }

# Create children for each activity
activities.each do |a|
  rand(6..10).times{ a.children.create(name: Faker::Name.name_with_middle) }
end
