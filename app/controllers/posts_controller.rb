class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
  end

  def create
    @new_post = current_user.posts.new post_params

    if @new_post.save
      redirect_to user_posts_path(@new_post.user.id), notice: 'Post successfully created!'
    else
      render :new
    end
  end

  def destroy
    post = Post.find params[:id]
    user = post.user

    if post.destroy
      redirect_to user_path(user.id), notice: 'Post deleted!'
    else
      redirect_to user_path(user.id), alert: 'Failed to delete post!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
