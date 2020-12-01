class Project < ApplicationRecord
    belongs_to :creator
    has_many :project_artists
    has_many :artists, through: :project_artists
    
end
