# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# SERVERS

Server.create(name: 'Engineers RP Server - PST', address: '138.8.81.149:65', map: 'pl_hydro', password: 'pa55w0rd', dedicated: 'false', game: 'unspecified', players: '15', maxplayers: '15', region: 'PST')
Server.create(name: 'Super Fun Server - EST', address: '38.130.70.206:158', map: 'ph_hydro', password: 'pa55word1234', dedicated: 'false', game: 'unspecified', players: '8', maxplayers: '12', region: 'EST')
Server.create(name: 'lowgrav100%crits RP Server - CST', address: '197.222.66.91:233', map: 'mvm_dustbowl', password: 'password1234', dedicated: 'false', game: 'unspecified', players: '6', maxplayers: '29', region: 'CST')
Server.create(name: 'Carls Prophunt Server - CST', address: '168.231.125.193:123', map: 'ph_pipeline', password: 'pasphrase', dedicated: 'false', game: 'unspecified', players: '10', maxplayers: '22', region: 'CST')
Server.create(name: 'Carls Prophunt Server - PST', address: '26.148.159.192:250', map: 'arena_idle', password: 'pasword', dedicated: 'false', game: 'unspecified', players: '24', maxplayers: '29', region: 'PST')
Server.create(name: 'lowgrav100%crits Prophunt Server - PST', address: '18.30.172.160:33', map: 'arena_de_dust', password: 'pessvort', dedicated: 'false', game: 'unspecified', players: '9', maxplayers: '12', region: 'PST')
Server.create(name: 'Super Fun Server - PST', address: '99.71.29.81:179', map: 'plr_dustbowl', password: 'passwerd', dedicated: 'false', game: 'unspecified', players: '11', maxplayers: '11', region: 'PST')
Server.create(name: 'Engineers Server - EST', address: '75.64.227.42:197', map: 'mvm_hightower', password: 'password1234', dedicated: 'true', game: 'highlander', players: '17', maxplayers: '18', region: 'EST')
Server.create(name: 'Bobs Server - EST', address: '143.123.178.194:185', map: 'ctf_idle', password: 'passw0rd', dedicated: 'true', game: 'unspecified', players: '12', maxplayers: '17', region: 'EST')
Server.create(name: 'Carls RP Server - CST', address: '54.71.62.58:89', map: 'mvm_steel', password: 'pessword', dedicated: 'true', game: 'unspecified', players: '15', maxplayers: '15', region: 'CST')
Server.create(name: 'Bobs RP Server - EST', address: '134.248.250.48:159', map: 'pl_turbine', password: 'pesswerd', dedicated: 'false', game: 'unspecified', players: '9', maxplayers: '19', region: 'EST')
Server.create(name: 'Carls Prophunt Server - MST', address: '24.165.234.185:183', map: 'ph_steel', password: 'password', dedicated: 'true', game: 'unspecified', players: '19', maxplayers: '29', region: 'MST')
Server.create(name: 'Super Fun Prophunt Server - MST', address: '233.7.37.171:89', map: 'achievement_hightower', password: 'pa55vort', dedicated: 'true', game: 'highlander', players: '17', maxplayers: '18', region: 'MST')
Server.create(name: 'MLG Pro Only Server - PST', address: '96.32.105.199:254', map: 'cp_de_dust', password: 'pa55werd', dedicated: 'false', game: 'unspecified', players: '5', maxplayers: '10', region: 'PST')
Server.create(name: '24/7 2fort Server - PST', address: '162.70.80.221:254', map: 'cp_de_dust', password: 'password', dedicated: 'true', game: 'highlander', players: '9', maxplayers: '18', region: 'PST')
Server.create(name: 'MLG Pro Only RP Server - EST', address: '80.30.46.98:17', map: 'ctf_2fort', password: 'paswerd', dedicated: 'true', game: 'unspecified', players: '13', maxplayers: '26', region: 'EST')
Server.create(name: 'MLG Pro Only Server - MST', address: '231.201.161.85:30', map: 'arena_steel', password: 'possvort', dedicated: 'false', game: 'unspecified', players: '14', maxplayers: '26', region: 'MST')
Server.create(name: '24/7 2fort RP Server - CST', address: '251.5.248.28:31', map: 'arena_turbine', password: 'pasweird', dedicated: 'true', game: 'unspecified', players: '20', maxplayers: '24', region: 'CST')
Server.create(name: 'Bobs Server - PST', address: '200.169.3.121:1', map: 'mvm_turbine', password: 'pessphrase', dedicated: 'false', game: 'unspecified', players: '5', maxplayers: '18', region: 'PST')
Server.create(name: 'Carls Prophunt Server - MST', address: '26.24.243.59:115', map: 'arena_de_dust', password: 'paswort', dedicated: 'false', game: 'unspecified', players: '11', maxplayers: '23', region: 'MST')


# USERS

User.create!(username: 'admin1', email: 'cressel@andover.edu', steam_link: 'clyphord', region: 'EST', admin: true, password: 'password');
User.create!(username: 'admin2', email: 'tnemec@andover.edu', steam_link: 'something', region: 'EST', admin: true, password: 'password');
User.create!(username: 'claire', email: 'claire73@gmail.com', steam_link: 'claire420', region: 'EST', admin: false, password: 'password');
User.create!(username: 'heavy', email: 'heavy9@spam.com', steam_link: 'heavy420', region: 'CST', admin: false, password: 'password');
User.create!(username: 'mr_palfrey', email: 'mr_palfrey82@valvesoftware.net', steam_link: 'mr_palfrey', region: 'PST', admin: false, password: 'password');


# TEAMS

team = Team.new(name: "Prop hunt pros", game: "unspecified", captain: "1")
team.users_teams.build(role: "scout", user_id: "1", accepted: "true")
team.users_teams.build(role: "pyro", user_id: "2")
team.users_teams.build(role: "scout", user_id: "4")
team.users_teams.build(role: "pyro", user_id: "3")
team.save

team = Team.new(name: "all spai 6v6 team", game: "6v6", captain: "2")
team.users_teams.build(role: "spy", user_id: "2", accepted: "true")
team.users_teams.build(role: "spy", user_id: "1")
team.users_teams.build(role: "spy", user_id: "3")
team.users_teams.build(role: "spy", user_id: "5")
team.save
