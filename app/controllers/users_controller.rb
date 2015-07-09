class UsersController < ApplicationController

  before_filter :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    @users = User.all
    redirect_to users_path
  end

  def index
    @users = User.all
  end

end
