class AddEmailToUsuarios < ActiveRecord::Migration[5.2]
    def change
      add_column :usuarios, :email, :string
      add_index :usuarios, :email, unique: true
    end
  end
  