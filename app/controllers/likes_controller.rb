class LikesController < ApplicationController
  before_action :set_user_and_post, only: [:new, :create, :destroy]

  def new
    @like = @post.likes.new
  end

  def create
    @like = @post.likes.build(user: current_user)

    if @like.save
      flash[:success] = 'Liked the post!'
      @post.update_likes_counter
    else
      flash[:error] = 'Unable to like the post.'
    end

    redirect_to user_post_path(@user, @post)
  end

  def destroy
    @like = @post.likes.find(params[:id])

    if @like.destroy
      flash[:success] = 'Unliked the post!'
      @post.update_likes_counter
    else
      flash[:error] = 'Unable to unlike the post.'
    end

    redirect_to user_post_path(@user, @post)
  end

  private

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end
end
