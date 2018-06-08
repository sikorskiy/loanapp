class LoansController < ApplicationController
  
  def index
    #@loans = Loan.paginate(per_page: 5, page: params[:page]) 
    @loans = Loan.where("user_id = ?", current_user.id).paginate(per_page: 5, page: params[:page]) 
  end

  def new
    @loan = Loan.new

  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    @loan = Loan.find(params[:id])
    @loan.update_attributes(sum: params[:loan][:sum],term: params[:loan][:term],interest: params[:loan][:interest], user_id: current_user.id)
    if @loan.errors.any?
      render "edit"
    else
      redirect_to loan_path(@loan)
    end

  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    redirect_to loans_path
  end

  def show
    @loan = Loan.find(params[:id])
    if @loan.user != current_user 
      redirect_to loans_path
    end
  end

  def create
    @user = current_user
    user_id = @user.id
    @loan = Loan.create(sum: params[:loan][:sum],term: params[:loan][:term],interest: params[:loan][:interest], user_id: user_id )
    if @loan.errors.empty?
      redirect_to loan_path(@loan)
    else
      render 'new'
    end

  end

  private
  def user_params
    @user = current_user
    params.require(:loan).permit(:sum,:term,:interest,:user_id)
  end

end
