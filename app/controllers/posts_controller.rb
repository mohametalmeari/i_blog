class PostsController < ApplicationController
  layout 'standard'
  def index
    @user = User.includes(:posts).find(params[:user_id]) # N+1
    @user.update_posts_counter
    @posts = Post.where(author: @user)
    @posts.each do |post|
      post.update_comments_counter
      post.update_likes_counter
    end
    render status: 200
  end

  def show
    @new_comment = Comment.new
    @new_like = Like.new

    @post = Post.includes(:comments).find(params[:id]) # N+1
    @post.update_comments_counter
    @post.update_likes_counter
    @user = @post.author
    @comments = Comment.where(post: @post.id)
    render status: 200
  end

  def new
    @new_post = Post.new
    @user = current_user
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

  def create_comment
    comment_params = params.require(:comment).permit(:text)
    @new_comment = Comment.new(comment_params)
    @new_comment.post = Post.find(params[:id])
    @new_comment.author = current_user

    @new_comment.save
    redirect_to request.referrer
  end

  def create_like
    @new_like = Like.new
    @new_like.post = Post.find(params[:id])
    @new_like.author = current_user

    @new_like.save
    # Redirect to the same page
    redirect_to request.referrer
  end
end
