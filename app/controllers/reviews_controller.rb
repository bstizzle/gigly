class ReviewsController < ApplicationController
    skip_before_action :authorized_creator

def index
    #byebug
end 

def show
    @reviews = @hire_artist.reviews
end 

def artist_reviews
    #byebug
    @reviews = Review.all.where(params[cookies[:add_artist_id]])
end 

end
