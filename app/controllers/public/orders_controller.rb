class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    if  @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif @order.address.empty?
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    else
      
    end
    @cart_items = current_customer.cart_items
    @total = 0
    @postage = 800
  end

  def complete
  end
  
  def create
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name)
  end
end
