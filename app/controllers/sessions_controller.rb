class SessionsController < ApplicationController
  helper_method :current_user, :authorize_user

    def new
    end
    def index
      redirect_to new_session_path
    end
    def login
    end
    def welcome 
    end
    def create
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:notice] = "Sorry, we can't find a user with that username and password"
        redirect_to new_user_path, notice: flash[:notice]
      end
    end
  
    def destroy
      session.destroy
      redirect_to new_user_path
    end

end
