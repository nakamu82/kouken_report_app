class AddColumnNameToSecurities < ActiveRecord::Migration[7.2]
  def change
    add_column :securities, :security_last_checked_on, :datetime
  end
end
