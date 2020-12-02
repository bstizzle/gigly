class Creator < ApplicationRecord
    has_many :projects
    has_many :project_artists, through: :projects
    has_many :artists, through: :project_artists
end
