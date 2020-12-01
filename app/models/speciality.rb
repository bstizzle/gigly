class Speciality < ApplicationRecord
    has_many :artist_specialities
    has_many :artists, through: :artist_specialities
    
end
