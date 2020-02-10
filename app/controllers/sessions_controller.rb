class SessionsController < ApplicationController

    def new
    end

    def login
    end
    def welcome 

    end
    def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to welcome_path
      else
        flash[:notice] = "Sorry, we can't find a user with that username and password"
        redirect_to new_session_path
      end
    end
  
    def destroy
      session.destroy
      redirect_to new_session_path
    end

end
