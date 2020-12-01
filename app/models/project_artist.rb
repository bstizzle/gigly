class ProjectArtist < ApplicationRecord
    belongs_to :project
    belongs_to :artist

end
