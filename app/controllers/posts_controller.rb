class PostsController < ApplicationController
  before_action :set_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = @user.posts.paginate(page: params[:page], per_page: 2)
  end

  def show
    @posts = @user.posts.find(params[:id])
    @comments = @posts.comments
    @comments_user = @comments.map(&:user)
  end

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
