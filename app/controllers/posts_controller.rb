class PostsController < ApplicationController
    # before_action :authorize_user, only: [:new,:create,:edit,:update,:destroy]
    # before_action :find_post, only: [:show, :edit, :update, :destroy]
    # before_action :post_belongs_to_current_user?, only: [:edit, :update, :destroy]
    def show 
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def edit
    end

    def create
        @post = Post.create(post_params)
        @post.user_id = current_user
        @post.save
        if @post.valid?
            redirect_to user_path(@user)
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
        redirect to posts_path
    end

    def find_post
        Post.find(params[:id])
    end
    private

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
