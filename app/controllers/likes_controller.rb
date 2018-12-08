class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, posting_id: params[:posting_id])
    @likes = Like.where(posting_id: params[:posting_id])
    @posting = Posting.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, posting_id: params[:posting_id])
    like.destroy
    @likes = Like.where(posting_id: params[:posting_id])
    @posting = Positng.all
  end
end
