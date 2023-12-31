class PostsController < ApplicationController
  layout 'standard'

  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Access denied'
  end

  def index
    @user = User.includes(:posts).find(params[:user_id]) # N+1
    @user.update_posts_counter
    @posts = Post.where(author: @user)
    @posts.each do |post|
      post.update_comments_counter
      post.update_likes_counter
    end
    render status: 200

    respond_to do |format|
      format.html
      format.xml { render xml: @posts }
      format.json { render json: @posts }
    end
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

    respond_to do |format|
      format.html
      format.xml { render xml: @post.comments }
      format.json { render json: @post.comments }
    end
  end

  def new
    @new_post = Post.new
    @user = current_user
  end

  def create
    @new_post = Post.new(post_params)
    @new_post.author = current_user
    if @new_post.save
      flash[:notice] = 'Post created!'
      redirect_to "/users/#{current_user.id}/posts/#{@new_post.id}"
    else
      flash[:notice] = @new_post.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  def destroy
    @del_post = Post.find(params[:id])
    @post_comments = @del_post.comments
    @post_comments.destroy_all
    @post_likes = @del_post.likes
    @post_likes.destroy_all
    @del_post.destroy
    redirect_to users_path, notice: 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
