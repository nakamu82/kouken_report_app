class RenameColumsInSecurities < ActiveRecord::Migration[7.2]
  def change
    rename_column :securities, :kind, :security_kind
    rename_column :securities, :name, :security_name
  end
end
