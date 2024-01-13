class CommentsController < ApplicationController
    before_action :set_user_and_post, only: [:create, :destroy]
  
    def create
      @comment = @post.comments.new(comment_params)
      if @comment.save
        redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
      else
        render 'posts/show'
      end
    end
  
    def destroy
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully destroyed.'
    end
  
    private
  
    def set_user_and_post
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:post_id])
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  