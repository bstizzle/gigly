class ProjectSpecialtiesController < ApplicationController
    skip_before_action :authorized_creator

    def new
        @project_specialty = ProjectSpecialty.new
        @projects = Project.all
        @specialties = Specialty.all
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
