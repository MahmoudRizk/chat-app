# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Application.create!([
  { uuid: "5839e194-5272-42dd-9fb6-157eb7be5e70", name: 'First Application' },
  { uuid: "105b03ca-1bcb-4f74-8953-46c0abcff05b", name: 'Second Application' },
  { uuid: "162f4a8e-6cef-4fd0-ac49-a786dbbaa25c", name: 'Third Application' }
])