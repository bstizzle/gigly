class ArtistsController < ApplicationController


    def index
        @artists = Artist.all
    end


    def new
        @artist = Artist.new
    end

    def show
        @artist = Artist.find(params[:id])
    end


    def create
        @artist = Artist.create(artist_params)
         
        if @artist.valid?
            redirect_to new_artist_specialty_path(@artist)
        else
            flash[:artist_errors] = @artist.errors.full_messages
            redirect_to new_artist_path
        end
    end


    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.update(artist_params)

        redirect_to artist_path(@artist)
    end

    def destroy
        @artist = Artist.find(params[:id])
        @artist.destroy

        redirect_to artists_path
    end

    private

    def artist_params
        params.require(:artist).permit(:first_name, :last_name, :email, :password, :bio, :rate, :location)
    end


end
