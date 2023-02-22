class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirm
    select_address = params[:select_address]
    if select_address == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif select_address == 1
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order = Order.new(order_params)
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
