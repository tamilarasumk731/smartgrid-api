class CreateRyders < ActiveRecord::Migration[6.0]
  def change
    create_table :ryders do |t|
      t.string :name
      t.string :mobile
      t.float :ryder_lat
      t.float :ryder_lng
      t.boolean :available

      t.timestamps
    end
  end
end
