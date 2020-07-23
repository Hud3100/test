class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      redirect_to home_index_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
