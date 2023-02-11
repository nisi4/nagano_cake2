class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { payment_waiting: 0,payment_confirmation: 1,in_production: 2,preparing_delivery: 3,delivered: 4 }
  enum product_status: { start_not_possible: 0,production_pending: 1,in_production: 2,production_complete: 3 }
  
  belongs_to :customer
  has_many :order_items,dependent: :destroy
end
