class Product < ApplicationRecord
  has_many :retail_products, dependent: :destroy
  has_many :retailers, through: :retail_products, dependent: :destroy
  has_many :orders, dependent: :destroy
end
