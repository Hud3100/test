class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.all
    @post = Post.new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render 'index'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [])
  end
end
