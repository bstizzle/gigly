class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end 

    def new
        @project = Project.new
        @creators = Creator.all
    end 

    def create
        @project = Project.create(project_params)

        if @project.valid?
            redirect_to new_project_specialty_path
        else 
            flash[:project_errors] = @project.errors.full_messages
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
        params.require(:project).permit(:name, :description, :deadline, :location, :creator_id)
    end
end
