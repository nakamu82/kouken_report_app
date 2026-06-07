class AddDepositTypeToDeposits < ActiveRecord::Migration[7.2]
  def change
    add_column :deposits, :deposit_type, :string
  end
end
