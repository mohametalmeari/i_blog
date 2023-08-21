class UsersController < ApplicationController
  layout 'standard'
  def index
    @users = User.all
    @users.each do |user|
      user.update_posts_counter
    end
    render status: 200
  end

  def show
    @user = User.find(params[:id])
    @user.update_posts_counter
    @posts = @user.three_most_recent_posts
    @posts.each do |post|
      post.update_comments_counter
      post.update_likes_counter
    end
    render status: 200
  end
end
