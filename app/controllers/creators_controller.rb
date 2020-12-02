class CreatorsController < ApplicationController

    before_action :find_creator, only: [:show, :edit, :update, :destroy]

    def index
        @creators = Creator.all
    end 

    def show 
    end

    def new 
        @creator = Creator.new
    end 

    def create
        @creator = Creator.create(creator_params)

        if @creator.valid? 
            redirect_to creator_path(@creator)
        else 
            flash[:creator_errors] = @creator.errors.full_messages
            redirect_to new_creator_path
        end 

    end 

    def edit
    end 

    def update

        @creator.update(creator_params)

        if @creator.valid? 
            redirect_to creator_path(@creator)
        else 
            flash[:errors] = @creator.errors.full_messages
            redirect_to new_creator_path
        end 

    end 

    def destroy
        @creator.destroy
        redirect_to creators_path
    end

    
    private
        
    def creator_params
        params.require(:creator).permit(:first_name, :last_name, :email, :password_digest, :bio)
    end 

    def find_creator
        @creator = Creator.all.find(params[:id])
    end 

end
