class ArtistSpecialtiesController < ApplicationController
    def new
        @artist_specialty = ArtistSpecialty.new
    end

    def create
        params[:artist_specialty][:specialty_id].each do |spec|
            @artist_specialty = ArtistSpecialty.new
            @artist_specialty[:artist_id] = params[:artist_specialty][:artist_id]
            @artist_specialty[:specialty_id] = spec
            @artist_specialty.save
        end

        redirect_to artist_path(@artist_specialty.artist)
    end

end
