class ProjectSpecialtiesController < ApplicationController
    def new
        @project_specialty = ProjectSpecialty.new
    end

    def create
        params[:project_specialty][:specialty_id].each do |spec|
            @project_specialty = ProjectSpecialty.new
            @project_specialty[:project_id] = params[:project_specialty][:project_id]
            @project_specialty[:specialty_id] = spec
            @project_specialty.save
        end

        redirect_to project_path(@project_specialty.project)
    end
end
