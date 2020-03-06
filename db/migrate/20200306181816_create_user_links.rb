class CreateUserLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_links do |t|
      t.string :user_name
      t.string :user_mail

      t.timestamps
    end
  end
end
