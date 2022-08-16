# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create([{email: "miriom@bar.com", password: "123456"}, {email: "trom@bar.com", password: "123456"}, {email: "lim@bar.com", password: "123456"}])

user1 = User.find(1)
user2 = User.find(2)
user3 = User.find(3)

user1.friends << user2
user2.friends << user1

user1.friends << user3
user3.friends << user1