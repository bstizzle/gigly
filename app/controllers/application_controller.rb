class ApplicationController < ActionController::Base
    before action :authorized

    def authorized
        if @creator
            redirect_to new_creator_path unless @current_creator
        else 
            redirect_to new_artist_path unless @current_artist
        end
    end


end
