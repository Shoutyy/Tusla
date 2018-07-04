# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
User.destroy_all
Category.destroy_all

Category.create(name: "Alimentaire")
Category.create(name: "Medicament")
Category.create(name: "Ingredient")



50.times do

  new_user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
    )
  new_product = Product.create(
    name: Faker::Superhero.name,
    description: Faker::Lorem.sentence,
    price: Random.rand(5..400),
    stock: Random.rand(0..50),
    published: true,
    category: Category.last,
    user: new_user
    )
end

private

new_user = User.create(
    first_name: "Raptor",
    last_name: "Jesus",
    email: "raptorjesus@gmail.com",
    password: "pmolik",
    admin: true,
    seller: true
    )
new_user = User.create(
    first_name: "Tyler",
    last_name: "Durden",
    email: "tylerdurdens@gmail.com",
    password: "azerty",
    admin: true,
    seller: true
    )
new_user = User.create(
    first_name: "Messire",
    last_name: "Vanbesien",
    email: "messirevanbesien@gmail.com",
    password: "azerty",
    admin: true,
    seller: true
    )
