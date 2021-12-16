# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "franco", password: "123456789")
enterprise = Enterprise.create(name: "calisto.srl", nationality: "Argentina", user: user)


user = User.create(username: "meli", password: "123456789")
candidate = Candidate.create(name:"Melisa",lastname:"Sosa",birth_date: 30/10/1995,user: user)

