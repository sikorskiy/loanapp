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
    @loan.update_attributes(sum: params[:loan][:sum], term: params[:loan][:term], interest: params[:loan][:interest], user_id: params[:loan][:user_id])
    redirect_to loan_path(@loan)
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
    @loan = Loan.create(sum: params[:loan][:sum], term: params[:loan][:term], interest: params[:loan][:interest], user_id: params[:loan][:user_id])
    redirect_to loan_path(@loan)
  end

end
