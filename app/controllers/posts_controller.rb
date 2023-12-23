class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @posts = @user.posts.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end
end
