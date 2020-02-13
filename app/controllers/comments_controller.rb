class CommentsController < ApplicationController

   


    def create
        @post = Post.find(params[:post_id])
        user_id = current_user
        @comment = @post.comments.create(params[:comment].permit(:content, :user_id))
        redirect_to post_path(@post)
    end

    private


end