class CreateUserData < ActiveRecord::Migration[6.0]
  def change
    create_table :user_data do |t|
      t.references  :user_link,     null: false
      t.string :site
      t.string :current_url
      t.string :from_url
      t.string :lat
      t.string :lng
      t.float :duration

      t.timestamps
    end
  end
end
