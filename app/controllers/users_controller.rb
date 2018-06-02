class UsersController < ApplicationController
  
  def index
    @users = User.paginate(per_page: 5, page: params[:page]) 
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def create
    @user = User.create(name: params[:user][:name], lastname: params[:user][:lastname], email: params[:user][:email])
    redirect_to user_path(@user)
  end

end
