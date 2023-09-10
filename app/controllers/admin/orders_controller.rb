class Admin::OrdersController < ApplicationController
   def show
     @order = Order.find(params[:id])
     @order_items = @order.order_items.all
     @total_price = 0
     @postage = 800
   end
   
   def update
     @order = Order.find(params[:id])
     @order_items = OrderItem.where(order_id: params[:id])
     if @order.update(order_params)
        @order_items.update_all(product_status: 1) if @order.order_status == "payment_confirmation"
     end
     redirect_to admin_order_path(@order.id)
   end
   
   private
   def order_params
       params.require(:order).permit(:order_status)
   end
end
