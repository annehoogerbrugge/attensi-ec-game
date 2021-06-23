# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts ' Seeding the database...'
Player.find_or_create_by(name: 'Frenkie de Jong')
Player.find_or_create_by(name: 'Paul Pogba')
Player.find_or_create_by(name: 'Karim Benzema')
Player.find_or_create_by(name: 'Cristiano Ronaldo')
Player.find_or_create_by(name: 'Robert Lewandowski')
Player.find_or_create_by(name: 'Kevin De Bruyne')
Player.find_or_create_by(name: 'Kylian Mbappe')
Player.find_or_create_by(name: 'Harry Kane')
Player.find_or_create_by(name: 'Manuel Neuer')
Player.find_or_create_by(name: 'Bruno Fernandes')
Player.find_or_create_by(name: 'Antoine Griezmann')
Player.find_or_create_by(name: 'Memphis Depay')
Player.find_or_create_by(name: 'Manuel Locatelli')
Player.find_or_create_by(name: 'John Arne Riise')
Player.find_or_create_by(name: 'Orjan Nyland')
Player.find_or_create_by(name: 'Martin Odegaard')
Player.find_or_create_by(name: 'Nico Elvedi')
Player.find_or_create_by(name: 'Willi Orban')
Player.find_or_create_by(name: 'Lorenzo Insigne')
Player.find_or_create_by(name: 'Gerard Moreno')
starting_time = DateTime.now

Player.all.each do |player|
  starting_time -= 7.days
  Score.create(player: player, points: rand(1..100), start_time: starting_time, playing_time: rand(1..90))
  starting_time - 7.days
  Score.create(player: player, points: rand(1..100), start_time: starting_time, playing_time: rand(1..90))
end
