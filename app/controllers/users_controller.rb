class UsersController < ApplicationController
  layout 'standard'
  def index
    @users = User.all
    render status: 200
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.three_most_recent_posts
    render status: 200
  end
end
