class PostsController < ApplicationController
  def index; end
  def index
    @user = User.find(params[:user_id])
    @posts = @user.recent_posts
  end

  def show; end
  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
    @comments = @post.comments.all.order('created_at')
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)

    respond_to do |format|
      format.html do
        if post.save
          redirect_to user_post_path(post.user.id, post.id)
        else
          flash.now[:alert] = 'Error: post not published'
        end
      end
    end
  end

  private

  def post_params
    params.require(:data).permit(:title, :text)
  end
end
