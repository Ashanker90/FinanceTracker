class LoansController < ApplicationController

  def index
  @customer = Customer.find(params[:customer_id])
  render json: @customer.loans
  
  
    #customer = Customer.find(index_params)
    #ender json: @customer.loans
  end
  
  def new
    @customer = Customer.find(params[:customer_id])
    @loan = Loan.new(customer: @customer)
  end

  def create
    @loans = Loan.new(loan_params.merge(customer_id: params[:customer_id]))
    if @loans.save
        render json: @loans
    else
	render json: "Error creating", status: 422
    end
  end
  
  def index_params
    params.require(:customer_id)
  end
  
  def loan_params
    params.require(:loan).permit(:amount)
  end

  def show
     @loan = Loan.find(params[:id])
	 render json: @loan
  end
	
  def edit
    @customer = Customer.find(params[:customer_id])
    @loan = Loan.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:customer_id])
    @loan = Loan.find params[:id]
    if @loan.update(loan_params)
      render json: @loan, status: :ok
    else
      render json: "Error Updating", status: 422
    end
  end
  
  
  def delete
  end
end

# Most important activerecord methods
# Loan.new #initializes the object. Can take multiple params
# Loan.find(id), Only id will go. #
