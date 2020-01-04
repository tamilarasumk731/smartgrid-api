class ChangeColumnNameInOrder < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :rider_id, :ryder_id
  end
end
