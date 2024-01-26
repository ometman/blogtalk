class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show] 

  def index
    @users = User.all
  end

  def show
    # @user = User.find(params[:id])
    @user = current_user
    @posts = @user.posts.includes(:comments).all
  end
end

