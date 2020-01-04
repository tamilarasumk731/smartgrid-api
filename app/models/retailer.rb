class Retailer < ApplicationRecord
  has_many :retail_products, dependent: :destroy
  has_many :products, through: :retail_products, dependent: :destroy
end
