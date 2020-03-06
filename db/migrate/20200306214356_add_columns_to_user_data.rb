class AddColumnsToUserData < ActiveRecord::Migration[6.0]
  def change
  	add_column    :user_data, :start_date, :string
  	add_column    :user_data, :end_date, :string
  end
end
