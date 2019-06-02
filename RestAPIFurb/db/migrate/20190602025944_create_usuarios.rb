class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |u|
      u.string :email, :limit => 50
      u.string :senha, :limit => 100
    end
  end
end
