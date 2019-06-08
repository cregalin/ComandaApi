class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |u|
      u.string :email, :limit => 50
      u.string :password, :limit => 200
    end
  end
end
