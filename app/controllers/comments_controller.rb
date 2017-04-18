class CommentsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    artwork = Artwork.find_by(id: params[:artwork_id])
    if user
      render json: user.comments
    else
      render json: artwork.comments
    end
  end

  def create
    comment = Comment.new(comments_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment
      comment.destroy
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end
