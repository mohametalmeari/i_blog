class UsersController < ApplicationController
  layout 'standard'
  def index
    @users = User.all
    render status: 200
  end

  def show
    render status: 200
  end
end
