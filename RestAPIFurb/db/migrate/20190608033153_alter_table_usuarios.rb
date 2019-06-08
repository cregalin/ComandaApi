class AlterTableUsuarios < ActiveRecord::Migration[5.1]
  def change
    def change
      rename_column :usuarios, :senha, :password
    end
  end
end
