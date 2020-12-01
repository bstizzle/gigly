class SpecialitiesController < ApplicationController
    def index
        @specialities = Speciality.all
    end

    def show
        @speciality = Speciality.find(params[:id])
    end 

    def new
        @speciality = Speciality.new
    end 

    def create
        @speciality = Speciality.create(speciality_params)

        redirect_to speciality_path(@speciality)
    end 

    def edit
        @speciality = Speciality.find(params[:id])
    end

    def update
        @speciality = Speciality.find(speciality_params)

        redirect_to speciality_path(@speciality)
    end 

    def destroy
        @speciality = Speciality.find(params[:id])
        @speciality.delete
        
        redirect_to specialities_path
    end

    private

    def speciality_params
        params.require(:speciality).permit(:name)
    end
end
