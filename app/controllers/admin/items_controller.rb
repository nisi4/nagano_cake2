class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genre = Genre.all
  end
  
  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:introduction,:genre_id,:price,:is_active,:image)
  end
  
end
