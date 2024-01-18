class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @user_posts = @user ? @user.posts : []
  end
end
