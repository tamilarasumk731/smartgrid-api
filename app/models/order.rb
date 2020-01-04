class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :retailer
  belongs_to :ryder

  enum status: {'Placed'=> 0, 'Picked Up'=> 1, 'Delivered'=> 2}

  def self.update_orders_with_eta_and_route_info order_params
  	order = Order.new(order_params)
  	if order.save!
  	   return {status: true, order_details: order}
  	else
  	   return {status: false}
  	end
  end

end
