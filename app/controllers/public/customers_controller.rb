class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    customer = current_customer
    customer.update(params_customer)
    redirect_to customers_my_page_path
  end

  def unsubscribe
    @customer = current_customer
  end
  
  def withdraw
    customer = current_customer
    customer.update(is_deleted: true)
    sign_out current_customer
    redirect_to root_path
  end
  
  private
  def params_customer
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,
    :email,:postal_code,:address,:telephone_number)
  end
  
end
