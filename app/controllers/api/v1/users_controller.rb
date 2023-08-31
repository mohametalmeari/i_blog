class Api::V1::UsersController < ApplicationController
    layout 'standard'
    def index
      @users = User.all
      render json: @users, status: :ok, only: [:id, :name]
    end
  
    def show
      @user = User.find(params[:id]) 
      render json: @user, status: :ok, only: [:id, :name, :bio, :photo]
    end
  end