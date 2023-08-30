class CommentsController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Access denied'
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referrer, notice: 'Comment was successfully deleted.'
  end

  def create
    @new_comment = Comment.new(comment_params)
    @new_comment.post = Post.find(params[:id])
    # @new_comment.post = Post.find(22)
    @new_comment.author = current_user

    @new_comment.save
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
