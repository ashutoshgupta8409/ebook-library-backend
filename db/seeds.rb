# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Creating ebooks..."

Ebook.destroy_all

Ebook.create!(
  title: "Atomic Habits",
  author: "James Clear",
  description: "A practical guide to building good habits and breaking bad ones.",
)

Ebook.create!(
  title: "Clean Code",
  author: "Robert C. Martin",
  description: "A handbook of agile software craftsmanship.",
)

Ebook.create!(
  title: "The Pragmatic Programmer",
  author: "Andrew Hunt & David Thomas",
  description: "Classic software engineering practices.",
)

Ebook.create!(
  title: "Deep Work",
  author: "Cal Newport",
  description: "Rules for focused success in a distracted world.",
)

puts "Created #{Ebook.count} ebooks."