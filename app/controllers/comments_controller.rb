# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
