class LikesController < ApplicationController
    before_action :set_user_and_post, only: [:create, :destroy]
  
    def create
      @like = @post.likes.build(user: current_user)
    
      if @like.save
        @post.update_likes_counter  # Update likes_counter
        redirect_to @post, notice: 'Liked the post!'
      else
        redirect_to @post, alert: 'Unable to like the post.'
      end
    end
    
    def destroy
      @like = @post.likes.find(params[:id])
    
      if @like.destroy
        @post.update_likes_counter  # Update likes_counter
        redirect_to @post, notice: 'Unliked the post.'
      else
        redirect_to @post, alert: 'Unable to unlike the post.'
      end
    end
  
    private
  
    def set_user_and_post
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:post_id])
    end
  end
  