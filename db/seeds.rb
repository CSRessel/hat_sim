# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Server.create!(address: '1.2.3.4:5', map: 'ctf_example', password: 'examplepassword', dedicated: false, players: 3, maxplayers: 30)
Server.create!(address: '3.1.4.1:5', map: 'achievemenent_idle', password: 'examplepassword', dedicated: false, players: 8, maxplayers: 30)
