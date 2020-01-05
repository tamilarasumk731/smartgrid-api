module MapHelper
	def get_and_set_route_details_and_eta origin, destination, params, extra_params
		query = "https://apis.mapmyindia.com/advancedmaps/v1/b797c955mw9jehz4rnysrnwkdgd1eeno/route_eta/driving/#{origin[1].to_s},#{origin[0].to_s};#{destination[1].to_s},#{destination[0].to_s}?"
		res = RestClient.get(query)
		result = JSON.parse(res)
    route_info_eta = result["routes"][0]
    
		order_params = {user_id: params[:user_id], product_id: params[:product_id], ryder_id: extra_params[:ryder_id], retailer_id: extra_params[:retailer_id], status: 0, eta: route_info_eta["duration"], route_info: route_info_eta["geometry"] }
		Order.update_orders_with_eta_and_route_info order_params
	end

	def assign_retailers param
		clusters = load_big_data
		retailers = Retailer.all
		result_clusters = append_distance_to_retailers clusters, retailers
		user_cluster_id = find_cluster_that_user_belongs clusters, params[:order][:user_id]
		matched_retailer = optimize_best_retailer user_cluster_id[0], result_clusters, retailers
		matched_retailer[0].split('_').last #retailer id
	end

	def find_cluster_that_user_belongs clusters, u_id
		user = User.find(u_id)
		dist_usr = {}
		clusters.each do |key, clusters|
			dist = calculate_distance([user.lat, user.lng], clusters[0])
			dist_usr[key] = dist
		end
		dist_usr.min_by{|k, v| k}
	end

	def calculate_distance(loc1, loc2)
    rad_per_deg = Math::PI/180  
    rkm         = 6371        
    rm           = rkm * 1000    

    dlat_rad    = (loc2[0]-loc1[0]) * rad_per_deg 
    dlon_rad    = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad    = loc1.map {|i| i * rad_per_deg }.first
    lat2_rad    = loc2.map {|i| i * rad_per_deg }.first

    a           = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c           = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c 
  end

	def optimize_best_retailer user_cluster_id, result_clusters, retailers
		result_clusters[user_cluster_id].min_by{|k,v| v}
	end

	def load_big_data
		test_data = []
		CSV.foreach("geodata.csv", headers: true) do |row|
			test_data << [row[0].to_f, row[1].to_f]
		end
		dbscan = DBSCAN( test_data, :epsilon => 0.1, :min_points => 1, :distance => :haversine_distance2 )

		# pp dbscan.results
		clusters = dbscan.results
	end

	def append_distance_to_retailers clusters, retailers
		resultant_clusters = {}
		clusters.each do |key, clusters|
			retails = {}
			retailers.each do |retailer|
				dist = distance_of_clusters_and_retailers clusters[0], [retailer.retailer_lat, retailer.retailer_lng]
				retails["Retail_#{retailer.id}"] = dist
			end
			resultant_clusters[key] = retails
		end
		resultant_clusters
	end

	def distance_of_clusters_and_retailers cluster_lat_lng, retailer_lat_lng
		res = RestClient.get("https://apis.mapmyindia.com/advancedmaps/v1/b797c955mw9jehz4rnysrnwkdgd1eeno/route_eta/driving/#{cluster_lat_lng[1]},#{cluster_lat_lng[0]};#{retailer_lat_lng[1]},#{retailer_lat_lng[0]}?")
		result = JSON.parse(res)
		if result['routes']
			return result['routes'][0]['distance']
		else
			return 9999
		end
	end

	def assign_ryders
		ryders = Ryder.where( available: true )
		ryders[0].id
	end

end

# RestClient.get("https://apis.mapmyindia.com/advancedmaps/v1/b797c955mw9jehz4rnysrnwkdgd1eeno/route_eta/driving/13.0067,80.2206;12.9165,79.1325?")