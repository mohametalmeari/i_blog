class PostsController < ApplicationController
  layout 'standard'
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author: @user)
    render status: 200
  end

  def show
    render status: 200
  end
end
