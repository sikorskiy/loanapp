class UsersController < ApplicationController


  def index
    @users = User.order(params[:sorting].nil? ? "id" : params[:sorting]).paginate(per_page: 5, page: params[:page]) 
  end

  def new
    @user = User.new
  end

  def home
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    LoanMailer.sample_email(@user).deliver
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.errors.empty?
      redirect_to @user
    else
      render "edit"
    end
  end

  def create
    @user = User.create(user_params)
    if @user.errors.empty?
      #flash[:success] = "Welcome to LoanApp!"
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :lastname, :password, :password_confirmation)
    end

end
