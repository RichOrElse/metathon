# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Hacker.count.zero?
  Hacker.create name: "Ritchie", email: 'ritchie.buitre@indinero.com', password: 'password' 
  Hacker.create name: "Jet", email: 'jet.mariscal@indinero.com', password: 'password'
end

Category.create [{name: 'Food'}, {name: 'Travel'}] if Category.count.zero?