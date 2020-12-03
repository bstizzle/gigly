class ApplicationController < ActionController::Base
    before_action :find_current_creator
    before_action :authorized_creator
    before_action :find_current_project

    def find_current_creator
        @current_creator = Creator.find_by(id: cookies[:creator_id])
    end

    def authorized_creator
        redirect_to new_creator_path unless @current_creator
    end

    def find_current_project
        @current_project = Project.find_by(id: cookies[:project_id])
    end
end
