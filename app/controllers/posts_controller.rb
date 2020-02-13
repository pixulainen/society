class PostsController < ApplicationController
    # before_action :authorize_user, only: [:new,:create,:edit,:update,:destroy]
    before_action :find_post, only: [:show, :edit, :update, :destroy]
   # before_action :post_belongs_to_current_user?, only: [:edit, :update, :destroy]
    helper_method :current_user, :authorize_user
    
    def show
    end

    def new
        @post = Post.new
    end

    def edit
    end

    def create
        @post = Post.create(post_params)
        @post.user = current_user
        @post.save
        if @post.valid?
            flash[:notice] = "Post successful!"
            redirect_to user_path(current_user)
        else
            render :new
        end
       
    end

    def update 
        @post.update(post_params)
        redirect_to post_path(@post.id)
    end

    def destroy
        Post.destroy(params[:id])
        flash[:notice] = "Post was deleted."
        redirect_to user_path(current_user)
    end

    
    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:content,:user_id)
    end
    def post_belongs_to_current_user?
        unless post.find(params[:id]).user == current_user
          flash[:notice] = "Please leave other people's posts alone :("
          redirect_to posts_path
        end
    end
    
end
