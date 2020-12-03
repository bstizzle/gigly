class Project < ApplicationRecord
    belongs_to :creator
    has_many :project_artists
    has_many :artists, through: :project_artists
    has_many :project_specialties
    has_many :specialties, through: :project_specialties
    
    validates :name, presence: true
    validates :description, presence: true
    # validates :date, 
    #     date: { after: Proc.new { Date.current }, message: 'must be after today' },
    #     on: :create
   
    def self.search_by_location(search)
        if search
            search_location = search
            if self.where(location: search_location)
                self.where(location: search_location)
            else 
                Project.all
            end 
        else 
            Project.all
        end 
    end
end
