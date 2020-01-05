class OrdersController < ApplicationController
  include MapHelper

  def order_picked_up 
    begin
      ActiveRecord::Base.transaction do
        order = Order.find(pickup_params["id"])
        order.update(status: 1)
        order.ryder.update(available: false)
        render json: {status: true, message: "Order Picked Up"}, status: :ok and return
      end
    rescue => e
      render json: {status: false, message: e.error.messages}, status: :ok and return
    end
  end

  def create
    origin = [28.610981,77.227434]
    destination = [28.616679,77.212021]
    # retailer_id = assign_retailers
    retailer_id = 1
    # ryder_id = assign_ryders
    ryder_id = 1
    response = get_and_set_route_details_and_eta origin, destination, create_params, {retailer_id: retailer_id, ryder_id: ryder_id}

    if response[:status] == false
      render json: {status: false, message: "Order not created, Please Try Again"}, status: :ok and return
    else
      order = response[:order_details]
      order_details = ({status: order.status, retailer: order.retailer.name, user: order.user.name, route_info: order.route_info, eta: order.eta, ryder: order.ryder.name})
      render json: {status: true, message: "Order Placed", order_details: order_details}, status: :ok and return
    end
  end

  def show
    order = Order.find(params[:order_id])
    if order
      order_details = ({status: order.status, retailer: order.retailer.name, user: order.user.name, route_info: order.route_info, eta: order.eta, ryder: order.ryder.name})
      render json: {status: true, message: "Order Current Status", order_details: order_details}, status: :ok and return
    else
      render json: {status: false, message: "Order not found"}, status: :ok and return
    end
  end

  private
  def pickup_params
    params.require(:order).permit(:id)
  end

  def create_params
    params.require(:order).permit(:product_id, :user_id)
  end

  def show_params
    params.require(:order).permit(:order_id)
  end
  
end