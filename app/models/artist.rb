class Artist < ApplicationRecord
    has_many :project_artists
    has_many :projects, through: :project_artists
    has_many :artist_specialties
    has_many :specialties, through: :artist_specialties 
end
