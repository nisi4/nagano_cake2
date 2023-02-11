class Admin::OrdersController < ApplicationController
   def show
     @order = Order.find(params[:id])
     @order_items = @order.order_item.all
   end
   
   def update
   end
end
