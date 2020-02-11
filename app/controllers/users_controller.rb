class UsersController < ApplicationController
    def login
      @user = Usern.new
    end
    def index
      @users = User.all
    end
    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end
    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to '/welcome'
    end
    def update
      @user = User.find(params[:id])
      @user.update(edit_params)
      redirect_to user_path(@user.id)
    end
    
    def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
      def show
        @user = User.find(params[:id])
      end
      private
        def set_user
          @user = User.find(params[:id])
        end
    
        def user_params
          params.require(:user).permit(:username, :email, :password,:name,:surname,:age,:bio)
        end

        def edit_params
          params.require(:user).permit(:name, :surname, :bio, :age)
        end

end
