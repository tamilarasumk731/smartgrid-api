module MapHelper
	def get_and_set_route_details_and_eta origin, destination, params, extra_params
		query = "https://apis.mapmyindia.com/advancedmaps/v1/b797c955mw9jehz4rnysrnwkdgd1eeno/route_eta/driving/#{origin[1].to_s},#{origin[0].to_s};#{destination[1].to_s},#{destination[0].to_s}?"
		res = RestClient.get(query)
		result = JSON.parse(res)
		route_info_eta = result["routes"][0]
		order_params = {user_id: params[:user_id], product_id: params[:product_id], ryder_id: extra_params[:ryder_id], retailer_id: extra_params[:retailer_id], status: 0, eta: route_info_eta["duration"], route_info: route_info_eta["geometry"] }
		Order.update_orders_with_eta_and_route_info order_params
	end
end

# RestClient.get("https://apis.mapmyindia.com/advancedmaps/v1/b797c955mw9jehz4rnysrnwkdgd1eeno/route_eta/driving/13.0067,80.2206;12.9165,79.1325?")