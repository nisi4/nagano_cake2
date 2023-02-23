class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      
    end
    @cart_items = current_customer.cart_items
    @total = 0
    @postage = 800
  end
  
  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name,:payment,:customer_id,:postage)
  end
end
