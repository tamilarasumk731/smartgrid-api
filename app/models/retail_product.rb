class RetailProduct < ApplicationRecord
  belongs_to :retailer
  belongs_to :product
end
