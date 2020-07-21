class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
