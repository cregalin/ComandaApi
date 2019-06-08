class AlterTableUsuarios < ActiveRecord::Migration[5.1]
  def change
      rename_column :usuarios, :senha, :password_digest
  end
end
