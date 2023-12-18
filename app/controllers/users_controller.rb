class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
    render json: @user_posts
  end
end
