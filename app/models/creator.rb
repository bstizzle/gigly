class Creator < ApplicationRecord
    has_many :projects
    has_many :project_artists, through: :projects
    has_many :artists, through: :project_artists

    def to_s
        self.first_name + "  " + self.last_name
    end 

    def past_projects
        self.projects.select do |project|
            #select all projects with deadlines that have passed
            project.deadline < Date.today
        end 
    end 

end
