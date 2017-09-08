# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = Product.create([{name: 'Wyncode', description: 'The art of code', price_in_cents: 1000000}, {name: 'The Ultimate eBook', description: "it's an ebook.", price_in_cents: 10000}])
user = User.create(name: "Walter", email: "walter@sobchak.com", password: "test123", password_confirmation: "test123")
