class CreateComandas < ActiveRecord::Migration[5.1]
  def change
    create_table :comanda do |c|
      c.string :produtos, :limit => 200
      c.decimal :valortotal, precision: 10, scale: 2
    end
    add_reference :comanda, :usuario, foreign_key: true
  end
end
