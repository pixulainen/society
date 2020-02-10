# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
    user = User.create({
      username:Faker::Name.name,
      password: "test123",
      email: "email@email.com",
      name: Faker::Name.first_name,
      surname:Faker::Name.last_name, 
       age:rand(13..100),
      bio:Faker::Hipster.paragraphs(1)
    })
end
    # puts "Seeded"
    # t.string "username"
    # t.string "password"
    # t.string "email"
    # t.string "name"
    # t.string "surname"
    # t.integer "age"
    # t.text "bio"
    # t.string "avatar"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false