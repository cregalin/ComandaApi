class AddUserTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |u|
      u.string :email, :limit => 50
      u.string :password, :limit => 100
    end
  end
end
