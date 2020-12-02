class Creator < ApplicationRecord
    has_many :projects
    has_many :project_artists, through: :projects
    has_many :artists, through: :project_artists

    def to_s
        self.first_name + "  " + self.last_name
    end 

end
