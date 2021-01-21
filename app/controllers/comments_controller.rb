class CommentsController < ApplicationController

  def index
    @shop = Shop.find_by(params[:id])
    @comments = Comment.includes(:user).order("created_at DESC")
  end

  def create
    comment = Comment.create(comment_params)
    redirect_to "/shops/#{comment.shop.id}"
  end

  private
  def comment_params
    params.permit(:text).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end

end
