class CommentsController < ApplicationController

  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, notice: 'Access denied' 
  end

  
    def destroy
      @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to request.referrer, notice: "Comment was successfully deleted."
    end
  end
  