class PaymentsController < ApplicationController

  def index
	@loan = Loan.find(params[:loan_id])
    render json: @loan.payments
  end
  
  def new
	@customer = Customer.find(params[:customer_id])
	@loan = Loan.find(params[:loan_id])
    @payment = Payment.new(loan: @loan_id)
  end

  def create
    @payment = Payment.new(payment_params.merge(loan_id: params[:loan_id]))
    if @payment.save
        render json: @payment 
    else
	render json: "Error creating", status: 422
    end
  end
  
  def payment_params
    params.require(:payment).permit(:amount) 
  end

  def show
     @payment = Payment.find(params[:id])
	 render json: @payment
  end 
  
  
  def edit
    @customer = Customer.find(params[:customer_id])
	@loan = Loan.find(params[:loan_id])
    @payment = Payment.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:customer_id])
    @loan = Loan.find(params[:loan_id])
	@payment = Payment.find params[:id]
    if @payment.update(payment_params)
      render json: @payment, status: :ok
    else
      render json: "Error Updating", status: 422
    end
  end
  
  
  def delete
  end
end

