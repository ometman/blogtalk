class PostsController < ApplicationController
  before_action :set_user, only: [:index, :show, :new, :create]
  before_action :set_post, only: [:show]

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
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Error: Post could not be saved'
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
