class LikesController < ApplicationController
  def create
    @new_like = Like.new
    @new_like.post = Post.find(params[:id])
    @new_like.author = current_user

    @new_like.save
    # Redirect to the same page
    redirect_to request.referrer
  end
end
