class CustomersController < ApplicationController

  def index
    @customer = Customer.all
    render json: @customer
  end
  
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
        render json: @customer 
    else
	render json: "Error creating", status: 422
    end
  end
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number)
  end

  def show
     @customer = Customer.find(params[:id])
	 @loans = @customer.loans
	 render json: @customer
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      render json: @customer, status: :ok
    else
      render json: "Error Updating", status: 422
    end
  end
  
  
  def delete
  end
end
