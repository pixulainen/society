class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def show 
    end

    def new
        @post = Post.new
    end

    def edit
    end

    def create
        @post = Post.create(post_params)

        # if valid?
        #     redirect_to ?
        # else
        #     render :new
        # end
        redirect_to posts_path
    end

    def update 

        @post.update(post_params)
        redirect_to post_path(@post.id)
    end

    def destroy
        Post.destroy(params[:id])
        redirect to posts_path
    end


    private

    def post_params
        params.require(:post).permit(:content)
    end

    def find_post
        Post.find(params[:id])
    end
end
