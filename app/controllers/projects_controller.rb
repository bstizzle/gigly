class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end 

    def new
        @project = Project.new
    end 

    def create
        @project = Project.create(project_params)

        redirect_to project_path(@project)
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
