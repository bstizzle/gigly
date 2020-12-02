class ArtistSpecialtiesController < ApplicationController
    def new
        @artist_specialty = ArtistSpecialty.new
    end

    def create
        @artist_specialty = ArtistSpecialty.create(artist_spec_params)

        redirect_to artist_path(@artist_specialty.artist)
    end

    private

    def artist_spec_params
        params.require(:artist_specialty).permit(:artist_id, :specialty_id)
    end 

end
