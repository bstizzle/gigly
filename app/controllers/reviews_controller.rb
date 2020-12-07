class ReviewsController < ApplicationController
    skip_before_action :authorized_creator

    def index
        #byebug
    end 

    def show
        @reviews = @hire_artist.reviews
    end 

    def new
        @review = Review.new
    end

    def create
        @current_creator.reviews << Review.create(artist_id: @hire_artist.id)
        @current_creator.reviews.last.update(review_params)


        redirect_to artist_path(@hire_artist)
    end

    def artist_reviews
        #byebug
        @reviews = Review.all.where(params[cookies[:add_artist_id]])
    end 

    private

    def review_params
        params.require(:review).permit(:title, :description, :rating, :artist_id)
    end

end