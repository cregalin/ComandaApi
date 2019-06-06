class CreateComandas < ActiveRecord::Migration[5.1]
  def change
    create_table :comandas do |c|
      c.string :produtos, :limit => 200
      c.decimal :valortotal, precision: 10, scale: 2
    end
    add_reference :comandas, :usuario, foreign_key: true
  end
end