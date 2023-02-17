class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def create
    address = Address.new(params_address)
    address.customer_id = current_customer.id
    address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    address = Address.find(params[:id])
    address.update(params_address)
    redirect_to addresses_path
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end
  
  private
  def params_address
    params.require(:address).permit(:customer_id,:postal_code,:address,:name)
  end
end
