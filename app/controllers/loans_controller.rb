class LoansController < ApplicationController
  
  def index
    @loans = Loan.paginate(per_page: 5, page: params[:page]) 
  end

  def new
    @loan = Loan.new
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    @loan = Loan.find(params[:id])
    @loan.update_attributes(user_params)
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
  end

  def create
    @loan = Loan.create(user_params)
    if @loan.errors.empty?
      redirect_to loan_path(@loan)
    else
      render 'new'
    end

  end

  private
  def user_params
    params.require(:loan).permit(:sum,:term,:interest,:user_id)
  end

end
