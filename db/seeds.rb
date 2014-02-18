# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Server.create!(address: '1.2.3.4:5', map: 'ctf_example', password: 'examplepassword', dedicated: false, players: 3, maxplayers: 30, name: 'server 1', region: 'EST')
Server.create!(address: '3.1.4.1:5', map: 'achievemenent_idle', password: 'examplepassword', dedicated: false, players: 8, maxplayers: 30, name: 'server 2', region: 'MST')
Server.create!(address: '2.5.5.2:19', map: 'gah_maps', password: 'examplepassword', dedicated: true, players: 39, maxplayers: 109, name: 'server 3', region: 'PST', game: '6v6')
Server.create!(address: '2.6.5.2:29', map: 'cp_dustbowl', password: 'examplepassword', dedicated:true, players: 5, maxplayers: 24, name: 'server 4', region: 'EST', game: 'highlander')

User.create!(username: 'admin1', email: 'cressel@andover.edu', steam_link: 'clyphord', region: 'EST', admin: true, password: 'password');
User.create!(username: 'admin2', email: 'tnemec@andover.edu', steam_link: 'something', region: 'EST', admin: true, password: 'password');

Subforum.create!(name: 'Competition')

Chain.create!(title: 'Blah', body: 'bleh bleh bleh', subforum_id: '1', user_id: '1')

Post.create!(content: 'bluh bluh bluh bluh', chain_id: '1', user_id: '1')
