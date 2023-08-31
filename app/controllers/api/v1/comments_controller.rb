class Api::V1::CommentsController < ApplicationController
    load_and_authorize_resource
    rescue_from CanCan::AccessDenied do |_exception|
      redirect_to root_path, notice: 'Access denied'
    end
  
    def create
      @new_comment = Comment.new(comment_params)
      @new_comment.post = Post.find(params[:id])
      @new_comment.author = current_user

      if @new_comment.save
        render json: @new_comment, status: :created, location: @new_comment
      else
        render json: @new_comment.errors, status: :unprocessable_entity
      end

    end

    private
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
  