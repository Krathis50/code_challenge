# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   how to make a a new user:
#
#   user = User.create(:email => 'email here', :password => '123asd')   
#   user.role = 1       ;assigns role of admin.
#   user.save           ;saves the user's info and is ready to be logged in
#   
#   how to check if a user is admin:
#   user.admin?
#   the console should return either true of false.
#   if you need to make an admin, do:
#       user.role = 1
#   which will set to admin, and 0 to set to default level user.
#
