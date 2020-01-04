class CreateRetailers < ActiveRecord::Migration[6.0]
  def change
    create_table :retailers do |t|
      t.string :name
      t.float :retailer_lat
      t.float :retailer_lng

      t.timestamps
    end
  end
end
