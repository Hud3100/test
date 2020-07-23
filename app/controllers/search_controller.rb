class SearchController < ApplicationController
  def index
    posts = Post.where('content LIKE ?', "%#{params[:search]}%")
    comments = Comment.where('content LIKE ?', "%#{params[:search]}%")
    @results = posts + comments
  end
end
