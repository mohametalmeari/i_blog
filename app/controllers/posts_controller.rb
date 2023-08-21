class PostsController < ApplicationController
  layout 'standard'
  def index
    @user = User.find(params[:user_id])
    @user.update_posts_counter
    @posts = Post.where(author: @user)
    @posts.each do |post|
      post.update_comments_counter
      post.update_likes_counter
    end
    render status: 200
  end

  def show
    @post = Post.find(params[:id])
    @post.update_comments_counter
    @post.update_likes_counter
    @user = User.find(@post.author_id)
    @comments = Comment.where(post: @post.id)
    render status: 200
  end

  def new
    @new_post = Post.new
  end

  def create
    post_params = params.require(:post).permit(:title, :text)
    @new_post = Post.new(post_params)
    @new_post.author = current_user
    if @new_post.save
      redirect_to "/users/#{current_user.id}/posts/#{@new_post.id}"
    else
      flash[:error] = @new_post.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end
end
