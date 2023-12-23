class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user ? @user.posts : []
  end

  def all_posts
    @user = User.find_by(name: params[:id])
    @all_posts = User.all_posts(@user)
  end
end
