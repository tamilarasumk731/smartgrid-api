class Ryder < ApplicationRecord
  has_many :orders, dependent: :destroy
end
