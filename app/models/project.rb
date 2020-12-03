class Project < ApplicationRecord
    belongs_to :creator
    has_many :project_artists
    has_many :artists, through: :project_artists
    has_many :project_specialties
    has_many :specialties, through: :project_specialties
    
    validates :name, presence: true
    validates :description, presence: true
    # validates :date, future_date: {time.now +2.da}
end
