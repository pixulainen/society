class CommentsController < ApplicationController
    helper_method :current_user 

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:content, :user_id))
        @comment.user = current_user
        @comment.save
        redirect_to post_path(@post)
    end

    def destroy
        # @user.posts[2].comments[0].destroy
        
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        
        redirect_to post_path(post)
    end


    private


end