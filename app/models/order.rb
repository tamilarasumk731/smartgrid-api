class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :retailer
  belongs_to :ryder

  enum status: {'Placed'=> 0, 'Picked Up'=> 1, 'Delivered'=> 2}

end
