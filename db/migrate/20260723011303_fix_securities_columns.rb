class FixSecuritiesColumns < ActiveRecord::Migration[7.2]
  def change
    # 1. amount を string から integer に変更
    change_column :securities, :amount, :integer, using: 'amount::integer'

    # 2. datetime を date に変更
    change_column :securities, :security_last_checked_on, :date

    # 3. カラム名も他と揃えて last_checked_on に変更する場合
    rename_column :securities, :security_last_checked_on, :last_checked_on
  end
end
