class ReviewsController < ApplicationController
    skip_before_action :authorized_creator

def index
    #byebug
end 

def artist_reviews
    byebug
    @reviews = Review.all.where(params[:artist_id])
end 

end
