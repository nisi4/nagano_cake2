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
    cart_items = current_customer.cart_items.all
    cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.order_id = order.id
      order_item.item_id = cart.item_id
      order_item.price = cart.item.add_tax_price
      order_item.amount = cart.amount
      order_item.save
    end
    redirect_to orders_complete_path
    cart_items.destroy_all
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name,:payment,:customer_id,:postage)
  end
end
