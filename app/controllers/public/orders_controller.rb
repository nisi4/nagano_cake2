class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirm
    binding.pry
    
    
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
