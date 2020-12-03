require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Artist.destroy_all
Project.destroy_all
Specialty.destroy_all
Creator.destroy_all
ArtistSpecialty.destroy_all
ProjectArtist.destroy_all

Specialty.create(name: "Mixing")
Specialty.create(name: "Concert recording")
Specialty.create(name: "Mastering")

10.times do
    Specialty.create(name: Faker::Music.instrument)
end 

20.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    Artist.create(first_name: first_name, last_name: last_name, email: "#{first_name.downcase}@gmail.com", password: "#{first_name}", bio: Faker::Quote.famous_last_words, rate: rand(50..500), profile_picture: "https://robohash.org/#{Faker::Hipster.word}.png/?set=set4", location: Faker::Address.city)
end 

30.times do
    ArtistSpecialty.create(artist_id: Artist.all.sample.id, specialty_id: Specialty.all.sample.id)
end

20.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    Creator.create(first_name: first_name, last_name: last_name, email: "#{first_name.downcase}@gmail.com", password: "#{first_name}", bio: Faker::Quote.famous_last_words, profile_picture: Faker::Avatar.image)
end 

30.times do
    Project.create(creator_id: Creator.all.sample.id, name: Faker::Movie.title, description: Faker::Lorem.sentence, location: Faker::Address.city, deadline: Faker::Date.forward(days: 30))
end

20.times do
    ProjectArtist.create(project_id: Project.all.sample.id, artist_id: Artist.all.sample.id, accepted: "accepted")
end 

30.times 