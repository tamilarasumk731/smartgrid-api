class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references	:user,      null: false
      t.references	:product,   null: false
      t.references	:rider,     null: false
      t.references	:retailer,  null: false
      t.integer     :status,    null: false
      t.string      :eta,       null: false
      t.timestamps
    end
  end
end
