class Artist < ApplicationRecord
    has_many :project_artists
    has_many :projects, through: :project_artists
    has_many :artist_specialties
    has_many :specialties, through: :artist_specialties 
    has_secure_password
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, on: [:new, :create]
    validates :email, uniqueness: true
    validates :password, length: { minimum: 3 }, allow_blank: true

    def to_s
        self.first_name + "  " + self.last_name
    end 

end
