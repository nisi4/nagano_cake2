class Admin::OrdersController < ApplicationController
   def show
     @order = Order.find(params[:id])
     @order_items = @order.order_item.all
     @postage = 800
   end
   
   def update
     order = Order.find(params[:id])
     order.update()
   end
end
