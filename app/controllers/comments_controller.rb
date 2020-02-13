class CommentsController < ApplicationController
    helper_method :current_user 

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        # @comment.post = @post
        # @post = @comment.post
        @post = Post.find(params[:post_id])
        redirect_to post_path(@post)
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params[:comment].permit(:content, :user_id))
        @comment.user = current_user
        @comment.save
        flash[:notice] = "Comment posted!"
        redirect_to post_path(@post)
    end

    def edit
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
      end

    def update 
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])

        if @comment.update(params[:comment].permit(:content))
            flash[:notice] = "Edit successful"
            redirect_to post_path(@post)
        else 
            render 'edit'
        end
    end


    # def destroy
    #     # @user.posts[2].comments[0].destroy
        
    #     @post = Post.find(params[:post_id])
    #     @comment = @post.comments.find(params[:id])
    #     @comment.destroy
        
    #     redirect_to post_path(post)
    # end


    private


end