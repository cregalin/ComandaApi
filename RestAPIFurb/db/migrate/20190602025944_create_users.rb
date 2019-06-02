class CreateUsers < ActiveRecord::Migration[5.1]
  def begin
    ActiveRecord::Base.record_timestamps = false
  end
  def change
    create_table :users do |u|
      u.string :email, :limit => 50
      u.string :password, :limit => 100
    end
  end
end
