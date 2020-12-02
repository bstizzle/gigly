class SessionController < ApplicationController
    def new
    end

    def logout
        cookies.delete(:login_id)
        redirect_to new_login_path
    end

    def login

        if Creator.find_by(email: params[:session][:email])
            user = Creator.find_by(email: params[:session][:email])
            if user && user.authenticate(params[:session][:password])
                cookies[:login_id] = user.id
                redirect_to creator_path(user)
            else
                flash[:errors] = "Username or Password does not match" 
                redirect_to new_login_path
            end 

        elsif Artist.find_by(email: params[:session][:email])
            user = Artist.find_by(email: params[:session][:email])
            if user && user.authenticate(params[:session][:password])
                cookies[:login_id] = user.id
                redirect_to artist_path(user)
            else
                flash[:errors] = "Username or Password does not match" 
                redirect_to new_login_path
            end 
        else
            flash[:login_errors] = "No account with this email"
            redirect_to new_login_path
        end

    end 

end