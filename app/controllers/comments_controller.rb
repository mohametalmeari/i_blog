class CommentsController < ApplicationController
    def destroy
      @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to request.referrer, notice: "Comment was successfully deleted."
    end
  end
  