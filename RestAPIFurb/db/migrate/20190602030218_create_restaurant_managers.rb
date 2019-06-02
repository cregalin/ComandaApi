class CreateRestaurantManagers < ActiveRecord::Migration[5.1]
  def begin
    ActiveRecord::Base.record_timestamps = false
  end
  def change
    create_table :restaurant_manager do |r|
      r.string :products, :limit => 200
      r.decimal :products_amount, precision: 10, scale: 2
    end
    add_reference :restaurant_manager, :user, foreign_key: true
  end
end