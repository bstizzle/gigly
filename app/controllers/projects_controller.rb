class ProjectsController < ApplicationController
    skip_before_action :authorized_creator

    def index
        @projects = Project.all
    end

    def show
        #byebug
        @project = Project.find(params[:id])
        #byebug
    end 

    def new
        @project = Project.new
        @creators = Creator.all
    end 

    def create
        @current_creator.projects << Project.create(project_params)
        @project = @current_creator.projects.last

        if @project.valid?
            redirect_to new_project_specialty_path
        else 
            flash[:errors] = @project.errors.full_messages
            redirect_to new_project_path
        end
    end 

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])

        redirect_to project_path(@project)
    end 

    def destroy
        @project = Project.find(params[:id])
        @project.delete
        
        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:name, :description, :deadline, :location)
    end
end
