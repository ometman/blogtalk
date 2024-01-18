class CommentsController < ApplicationController
  before_action :set_user_and_post, only: %i[new create]

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = @user

    puts "User: #{@user.inspect}"
    puts "Post: #{@post.inspect}"
    puts "Comment: #{@comment.inspect}"

    if @comment.save
      flash[:success] = 'Comment was successfully created.'
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end


  private

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
