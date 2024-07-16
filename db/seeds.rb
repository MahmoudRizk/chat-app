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
  { id: 1, uuid: "5839e194-5272-42dd-9fb6-157eb7be5e70", name: 'First Application' },
  { id: 2, uuid: "105b03ca-1bcb-4f74-8953-46c0abcff05b", name: 'Second Application' },
  { id: 3, uuid: "162f4a8e-6cef-4fd0-ac49-a786dbbaa25c", name: 'Third Application' }
])


Chat.create!([
   { id: 1, name: "Application 1 first chat", :application_id => 1, count_in_application: 1},
   { id: 2, name: "Application 2 first chat", :application_id => 2, count_in_application: 1},
   { id: 3, name: "Application 3 first chat", :application_id => 3, count_in_application: 1},
   { id: 4, name: "Application 3 second chat", :application_id => 3, count_in_application: 2},
 ])