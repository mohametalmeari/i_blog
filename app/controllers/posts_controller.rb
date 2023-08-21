class PostsController < ApplicationController
  layout 'standard'
  def index
    render status: 200
  end

  def show
    render status: 200
  end
end
