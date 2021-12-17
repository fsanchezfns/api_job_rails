# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: 'franco', password: '123456789')
enterprise = Enterprise.create(name: 'calisto.srl', nationality: 'Argentina', user: user)
job = Job.create(name: 'Develoment Ruby',
                 description: 'Se necesita un programador junior que pueda cumplir con las siguiente espectavias',
                 requirements: 'estudiante o recibido de alguna facu del pais',
                 time: 'fulltime',
                 enterprise: enterprise)

job2 = Job.create(name: 'Develoment Java',
                  description: 'Se necesita un programador senior que pueda cumplir con las siguiente espectavias',
                  requirements: 'Ingeniero en sistemas de la información',
                  time: 'partime',
                  enterprise: enterprise)

user = User.create(username: 'meli', password: '123456789')
candidate = Candidate.create(name: 'Melisa', lastname: 'Sosa', birth_date: '10/10/1995', user: user)
subscription = Subscription.create(candidate: candidate, job: job, state: Subscription::STATE[:i])
