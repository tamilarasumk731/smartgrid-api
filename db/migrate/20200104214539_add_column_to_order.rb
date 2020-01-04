class AddColumnToOrder < ActiveRecord::Migration[6.0]
  def change
  	add_column    :orders, :route_info, :string
  end
end
