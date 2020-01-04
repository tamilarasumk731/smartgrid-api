class CreateRetailProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :retail_products do |t|
      t.references	:product,     null: false
      t.references	:retailer,    null: false
      t.boolean     :availablity, default: true
      

      t.timestamps
    end
  end
end
