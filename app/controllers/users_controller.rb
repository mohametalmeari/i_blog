class UsersController < ApplicationController
  layout 'standard'
  def index
    @users = User.all
    render status: 200
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(author: @user).last(3)
    render status: 200
  end
end
