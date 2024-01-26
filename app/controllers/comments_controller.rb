class CommentsController < ApplicationController
  before_action :set_user_and_post, only: %i[new create]
  before_action :find_comment, only: [:destroy]
  before_action :authorize_comment, only: [:destroy]

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = @user

    if @comment.save
      flash[:success] = 'Comment was successfully created.'
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post), notice: 'Comment was successfully destroyed.'
  end

  private

  def set_user_and_post
    @user = current_user
    @post = @user.posts.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_comment
    @comment = @post.comment

  def authorize_comment
    authorize! :destroy, @comment
  end
end






# app/controllers/comments_controller.rb
# class CommentsController < ApplicationController
#   before_action :find_comment, only: [:edit, :update, :destroy]
#   before_action :authorize_comment, only: [:edit, :update, :destroy]

#   # ...

#   def destroy
#     @comment.destroy
#     redirect_to post_path(@comment.post), notice: 'Comment was successfully destroyed.'
#   end

#   private

#   def authorize_comment
#     authorize! :destroy, @comment
#   end
# end
