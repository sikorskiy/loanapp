class UsersController < ApplicationController

  def index
    @users = User.order(params[:sorting].nil? ? "id" : params[:sorting]).paginate(per_page: 5, page: params[:page]) 
  end

  def new
    @user = User.new
  end

  def home
    if user_signed_in?
      @user = current_user
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(name: params[:user][:name], lastname: params[:user][:lastname])
    if @user.errors.empty?
      redirect_to @user
    else
      render "edit"
    end
  end

  def create
    @user = User.create(name: params[:user][:name], lastname: params[:user][:lastname])
    if @user.errors.empty?
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def destroy
    if params[:id] = "sign_out"
      sign_out current_user
      return
    end
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

end
