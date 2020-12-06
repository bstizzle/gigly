class Artist < ApplicationRecord
    has_many :project_artists
    has_many :projects, through: :project_artists
    has_many :artist_specialties
    has_many :specialties, through: :artist_specialties 
    has_many :reviews
    has_many :creators, through: :reviews
    has_secure_password
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, on: [:new, :create]
    validates :email, uniqueness: true
    validates :password, length: { minimum: 3 }, allow_blank: true

    def to_s
        self.first_name + "  " + self.last_name
    end 

    def past_projects
        self.projects.select do |project|
            project.deadline < Date.today
        end
    end

    def self.search_by_rate(search)
        if search
            search_rate = search
            rate_int = search_rate.to_i
            if self.where({rate: 0..rate_int})
               self.where({rate: 0..rate_int}).sort_by{|artist| artist.rate}
            else 
                Artist.all
            end 
        else 
            Artist.all
        end 
    end 



    def average_rating
       ((self.reviews.sum {|review| review.rating}).to_f / self.reviews.count.to_f).round(1)
    end 

    # def self.search_by_location(search)
    #     if search
    #         artist_location = search.capitalize()
    #         if self.where(location: artist_location)
    #          self.where(location: artist_location)
    #         else 
    #             Artist.all
    #         end 
    #     else Artist.all 
    #     end 
    # end  

end
