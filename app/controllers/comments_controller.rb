class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], posting_id: comment_params[:posting_id], user_id: current_user.id)
    redirect_to "/posting/#{@comment.posting.id}"
  end

  private
  def comment_params
    params.permit(:text, :posting_id)
  end
end
