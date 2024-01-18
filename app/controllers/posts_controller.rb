class PostsController < ApplicationController
  before_action :set_user, only: %i[index show new create]
  before_action :set_post, only: [:show]

  def index
    @posts = @user.posts.paginate(page: params[:page], per_page: 2)
  end

  def show
    @like = Like.new
  end

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(@user)
    else
      flash[:error] = 'Error: Post could not be saved'
      flash[:error_details] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
