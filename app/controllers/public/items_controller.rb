class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
  end
end
