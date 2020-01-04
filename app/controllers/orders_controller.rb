class OrdersController < ApplicationController
  
  def order_picked_up 
    order = Order.find(pickup_params["id"])
    if order.update(status: 1)
      render json: {status: true, message: "Order Picked Up"}, status: :ok and return
    else
      render json: {status: false, message: order}, status: :ok and return
    end

  end

  private
    def pickup_params
      params.require(:order).permit(:id)
    end

end