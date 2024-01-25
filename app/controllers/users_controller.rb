class UsersController < ApplicationController
  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = current_user
    @user_posts = @user ? @user.posts.includes(:comments).all : []
  end
end
