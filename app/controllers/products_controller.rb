class ProductsController < ApplicationController


	def search
		matched_products = Product.where("lower(name) like ?", "%#{params[:query].downcase}%")
		matched_products = matched_products.map{|product| {:id => product[:id], :name => product[:name]} }
		if matched_products.count > 1
			render json: {success: true, suggestions: matched_products}, status: :ok and return
		else
			render json: {success: false, suggestions: []}, status: :ok and return
		end
	end
	
end
