class UsersController < ApplicationController
  layout 'standard'
  def index
    @users = User.all
    @users.each(&:update_posts_counter)
    render status: 200
  end

  def show
    @user = User.includes(:posts).find(params[:id]) # N+1
    @user.update_posts_counter
    @posts = @user.three_most_recent_posts
    @posts.each do |post|
      post.update_comments_counter
      post.update_likes_counter
    end
    render status: 200
  end
end
