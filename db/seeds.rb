# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# SERVERS

@tf2_server_01 = Tf2Server.create!(name: 'Engineers RP Server - PST', address: '138.8.81.149:65', map: 'pl_hydro', password: 'pa55w0rd', dedicated: 'false', game: 'unspecified', players: '15', maxplayers: '15', region: 'PST')
@name_one_01 = "RED_#{@tf2_server_01.id}"
@name_two_01 = "BLUE_#{@tf2_server_01.id}"
@tf2_server_01.teams.build(name: @name_one_01)
@tf2_server_01.teams.build(name: @name_two_01)
@tf2_server_01.save!

@tf2_server_02 = Tf2Server.create!(name: 'Super Fun Server - EST', address: '38.130.70.206:158', map: 'ph_hydro', password: 'pa55word1234', dedicated: 'false', game: 'unspecified', players: '8', maxplayers: '12', region: 'EST')
@name_one_02 = "RED_#{@tf2_server_02.id}"
@name_two_02 = "BLUE_#{@tf2_server_02.id}"
@tf2_server_02.teams.build(name: @name_one_02)
@tf2_server_02.teams.build(name: @name_two_02)
@tf2_server_02.save!

@tf2_server_03 = Tf2Server.create!(name: 'lowgrav100%crits RP Server - CST', address: '197.222.66.91:233', map: 'mvm_dustbowl', password: 'password1234', dedicated: 'false', game: 'unspecified', players: '6', maxplayers: '29', region: 'CST')
@name_one_03 = "RED_#{@tf2_server_03.id}"
@name_two_03 = "BLUE_#{@tf2_server_03.id}"
@tf2_server_03.teams.build(name: @name_one_03)
@tf2_server_03.teams.build(name: @name_two_03)
@tf2_server_03.save!

@tf2_server_04 = Tf2Server.create!(name: 'Carls Prophunt Server - CST', address: '168.231.125.193:123', map: 'ph_pipeline', password: 'pasphrase', dedicated: 'false', game: 'unspecified', players: '10', maxplayers: '22', region: 'CST')
@name_one_04 = "RED_#{@tf2_server_04.id}"
@name_two_04 = "BLUE_#{@tf2_server_04.id}"
@tf2_server_04.teams.build(name: @name_one_04)
@tf2_server_04.teams.build(name: @name_two_04)
@tf2_server_04.save!

@tf2_server_05 = Tf2Server.create!(name: 'Carls Prophunt Server - PST', address: '26.148.159.192:250', map: 'arena_idle', password: 'passssword', dedicated: 'false', game: 'unspecified', players: '24', maxplayers: '29', region: 'PST')
@name_one_05 = "RED_#{@tf2_server_05.id}"
@name_two_05 = "BLUE_#{@tf2_server_05.id}"
@tf2_server_05.teams.build(name: @name_one_05)
@tf2_server_05.teams.build(name: @name_two_05)
@tf2_server_05.save!

@tf2_server_06 = Tf2Server.create!(name: 'lowgrav100%crits Prophunt Server - PST', address: '18.30.172.160:33', map: 'arena_de_dust', password: 'pessvort', dedicated: 'false', game: 'unspecified', players: '9', maxplayers: '12', region: 'PST')
@name_one_06 = "RED_#{@tf2_server_06.id}"
@name_two_06 = "BLUE_#{@tf2_server_06.id}"
@tf2_server_06.teams.build(name: @name_one_06)
@tf2_server_06.teams.build(name: @name_two_06)
@tf2_server_06.save!

@tf2_server_07 = Tf2Server.create!(name: 'Super Fun Server - PST', address: '99.71.29.81:179', map: 'plr_dustbowl', password: 'passwerd', dedicated: 'false', game: 'unspecified', players: '11', maxplayers: '11', region: 'PST')
@name_one_07 = "RED_#{@tf2_server_07.id}"
@name_two_07 = "BLUE_#{@tf2_server_07.id}"
@tf2_server_07.teams.build(name: @name_one_07)
@tf2_server_07.teams.build(name: @name_two_07)
@tf2_server_07.save!

@tf2_server_08 = Tf2Server.create!(name: 'Engineers Server - EST', address: '75.64.227.42:197', map: 'mvm_hightower', password: 'password1234', dedicated: 'true', game: 'highlander', players: '17', maxplayers: '18', region: 'EST')
@name_one_08 = "RED_#{@tf2_server_08.id}"
@name_two_08 = "BLUE_#{@tf2_server_08.id}"
@tf2_server_08.teams.build(name: @name_one_08)
@tf2_server_08.teams.build(name: @name_two_08)
@tf2_server_08.save!

@tf2_server_09 = Tf2Server.create!(name: 'Bobs Server - EST', address: '143.123.178.194:185', map: 'ctf_idle', password: 'passw0rd', dedicated: 'true', game: 'unspecified', players: '12', maxplayers: '17', region: 'EST')
@name_one_09 = "RED_#{@tf2_server_09.id}"
@name_two_09 = "BLUE_#{@tf2_server_09.id}"
@tf2_server_09.teams.build(name: @name_one_09)
@tf2_server_09.teams.build(name: @name_two_09)
@tf2_server_09.save!

@tf2_server_10 = Tf2Server.create!(name: 'Carls RP Server - CST', address: '54.71.62.58:89', map: 'mvm_steel', password: 'pessword', dedicated: 'true', game: 'unspecified', players: '15', maxplayers: '15', region: 'CST')
@name_one_10 = "RED_#{@tf2_server_10.id}"
@name_two_10 = "BLUE_#{@tf2_server_10.id}"
@tf2_server_10.teams.build(name: @name_one_10)
@tf2_server_10.teams.build(name: @name_two_10)
@tf2_server_10.save!

@tf2_server_11 = Tf2Server.create!(name: 'Bobs RP Server - EST', address: '134.248.250.48:159', map: 'pl_turbine', password: 'pesswerd', dedicated: 'false', game: 'unspecified', players: '9', maxplayers: '19', region: 'EST')
@name_one_11 = "RED_#{@tf2_server_11.id}"
@name_two_11 = "BLUE_#{@tf2_server_11.id}"
@tf2_server_11.teams.build(name: @name_one_11)
@tf2_server_11.teams.build(name: @name_two_11)
@tf2_server_11.save!

@tf2_server_12 = Tf2Server.create!(name: 'Carls Prophunt Server - MST', address: '24.165.234.185:183', map: 'ph_steel', password: 'password', dedicated: 'true', game: 'unspecified', players: '19', maxplayers: '29', region: 'MST')
@name_one_12 = "RED_#{@tf2_server_12.id}"
@name_two_12 = "BLUE_#{@tf2_server_12.id}"
@tf2_server_12.teams.build(name: @name_one_12)
@tf2_server_12.teams.build(name: @name_two_12)
@tf2_server_12.save!

@tf2_server_13 = Tf2Server.create!(name: 'Super Fun Prophunt Server - MST', address: '233.7.37.171:89', map: 'achievement_hightower', password: 'pa55vort', dedicated: 'true', game: 'highlander', players: '17', maxplayers: '18', region: 'MST')
@name_one_13 = "RED_#{@tf2_server_13.id}"
@name_two_13 = "BLUE_#{@tf2_server_13.id}"
@tf2_server_13.teams.build(name: @name_one_13)
@tf2_server_13.teams.build(name: @name_two_13)
@tf2_server_13.save!

@tf2_server_14 = Tf2Server.create!(name: 'MLG Pro Only Server - PST', address: '96.32.105.199:254', map: 'cp_de_dust', password: 'pa55werd', dedicated: 'false', game: 'unspecified', players: '5', maxplayers: '10', region: 'PST')
@name_one_14 = "RED_#{@tf2_server_14.id}"
@name_two_14 = "BLUE_#{@tf2_server_14.id}"
@tf2_server_14.teams.build(name: @name_one_14)
@tf2_server_14.teams.build(name: @name_two_14)
@tf2_server_14.save!

@tf2_server_15 = Tf2Server.create!(name: '24/7 2fort Server - PST', address: '162.70.80.221:254', map: 'cp_de_dust', password: 'password', dedicated: 'true', game: 'highlander', players: '9', maxplayers: '18', region: 'PST')
@name_one_15 = "RED_#{@tf2_server_15.id}"
@name_two_15 = "BLUE_#{@tf2_server_15.id}"
@tf2_server_15.teams.build(name: @name_one_15)
@tf2_server_15.teams.build(name: @name_two_15)
@tf2_server_15.save!

@tf2_server_16 = Tf2Server.create!(name: 'MLG Pro Only RP Server - EST', address: '80.30.46.98:17', map: 'ctf_2fort', password: 'paswerdeee', dedicated: 'true', game: 'unspecified', players: '13', maxplayers: '26', region: 'EST')
@name_one_16 = "RED_#{@tf2_server_16.id}"
@name_two_16 = "BLUE_#{@tf2_server_16.id}"
@tf2_server_16.teams.build(name: @name_one_16)
@tf2_server_16.teams.build(name: @name_two_16)
@tf2_server_16.save!

@tf2_server_17 = Tf2Server.create!(name: 'MLG Pro Only Server - MST', address: '231.201.161.85:30', map: 'arena_steel', password: 'possvort', dedicated: 'false', game: 'unspecified', players: '14', maxplayers: '26', region: 'MST')
@name_one_17 = "RED_#{@tf2_server_17.id}"
@name_two_17 = "BLUE_#{@tf2_server_17.id}"
@tf2_server_17.teams.build(name: @name_one_17)
@tf2_server_17.teams.build(name: @name_two_17)
@tf2_server_17.save!

@tf2_server_18 = Tf2Server.create!(name: '24/7 2fort RP Server - CST', address: '251.5.248.28:31', map: 'arena_turbine', password: 'pasweird', dedicated: 'true', game: 'unspecified', players: '20', maxplayers: '24', region: 'CST')
@name_one_18 = "RED_#{@tf2_server_18.id}"
@name_two_18 = "BLUE_#{@tf2_server_18.id}"
@tf2_server_18.teams.build(name: @name_one_18)
@tf2_server_18.teams.build(name: @name_two_18)
@tf2_server_18.save!

@tf2_server_19 = Tf2Server.create!(name: 'Bobs Server - PST', address: '200.169.3.121:1', map: 'mvm_turbine', password: 'pessphrase', dedicated: 'false', game: 'unspecified', players: '5', maxplayers: '18', region: 'PST')
@name_one_19 = "RED_#{@tf2_server_19.id}"
@name_two_19 = "BLUE_#{@tf2_server_19.id}"
@tf2_server_19.teams.build(name: @name_one_19)
@tf2_server_19.teams.build(name: @name_two_19)
@tf2_server_19.save!

@tf2_server_20 = Tf2Server.create!(name: 'Carls Prophunt Server - MST', address: '26.24.243.59:115', map: 'arena_de_dust', password: 'paswort', dedicated: 'false', game: 'unspecified', players: '11', maxplayers: '23', region: 'MST')
@name_one_20 = "RED_#{@tf2_server_20.id}"
@name_two_20 = "BLUE_#{@tf2_server_20.id}"
@tf2_server_20.teams.build(name: @name_one_20)
@tf2_server_20.teams.build(name: @name_two_20)
@tf2_server_20.save!



# USERS

User.create!(username: 'admin1', email: 'cressel@andover.edu', steam_link: 'clyphord', region: 'EST', admin: true, password: 'password');
User.create!(username: 'admin2', email: 'tnemec@andover.edu', steam_link: 'something', region: 'EST', admin: true, password: 'password');
User.create!(username: 'claire', email: 'claire73@gmail.com', steam_link: 'claire420', region: 'EST', admin: false, password: 'password');
User.create!(username: 'heavy', email: 'heavy9@spam.com', steam_link: 'heavy420', region: 'CST', admin: false, password: 'password');
User.create!(username: 'mr_palfrey', email: 'mr_palfrey82@valvesoftware.net', steam_link: 'mr_palfrey', region: 'PST', admin: false, password: 'password');


# TEAMS

team = Team.new(name: "Prop hunt pros", game: "unspecified", captain: "1")
team.users_teams.build(role: "scout", user_id: "1", accepted: "true")
team.users_teams.build(role: "pyro", user_id: "2", accepted: "false")
team.users_teams.build(role: "scout", user_id: "4", accepted: "false")
team.users_teams.build(role: "pyro", user_id: "3", accepted: "false")
team.save

team = Team.new(name: "all spai 6v6 team", game: "6v6", captain: "2")
team.users_teams.build(role: "spy", user_id: "2", accepted: "true")
team.users_teams.build(role: "spy", user_id: "1", accepted: "false")
team.users_teams.build(role: "spy", user_id: "3", accepted: "false")
team.users_teams.build(role: "spy", user_id: "5", accepted: "false")
team.save

team = Team.new(name: "super kewl pro gamers", game: "highlander", captain: "4")
team.users_teams.build(role: "soldier", user_id: "4", accepted: "true")
team.users_teams.build(role: "spy", user_id: "2", accepted: "true")
team.users_teams.build(role: "medic", user_id: "1", accepted: "true")
team.save
