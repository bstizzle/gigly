class ProjectSpecialtiesController < ApplicationController
    skip_before_action :authorized_creator

    def new
        @project_specialty = ProjectSpecialty.new
        @projects = Project.all
        @specialties = Specialty.all
    end

    def create
        params[:project_specialty][:specialty_id].each do |spec|
            @current_creator.projects.last.project_specialties << ProjectSpecialty.create(specialty_id: spec)
        end

        redirect_to project_path(@current_creator.projects.last)
    end
end
