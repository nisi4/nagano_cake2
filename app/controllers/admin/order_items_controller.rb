class Admin::OrderItemsController < ApplicationController
  def update
    order_item = Order_item.find(params[:id])
    order_item.update()
  end
end
